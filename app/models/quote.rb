# coding: utf-8
class Quote < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: :user, only: [:create], params: {
    summary: proc { |c, m| c && c.truncate(m.content, length: 100) }
  }
  paginates_per 10

  belongs_to :user
  belongs_to :author, counter_cache: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :photos, dependent: :destroy
  belongs_to :source_wiki, class_name: 'Wiki', foreign_key: :source_wiki_id
  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: :all_blank

  validates :content, presence: true

  scope :recent, -> { order('quotes.created_at DESC') }
  scope :in, ->(language) { where(language: language) }

  before_create :detect_and_set_language

  def language_in_its_own
    case language
    when 'chinese' then '中文'
    when 'japanese' then '日本語'
    else language.capitalize
    end
  end

  def source_is_link?
    !! (source =~ %r{(http|https)://})
  end

  def author_name
    author.try(:name)
  end

  def author_name=(name)
    return if author_id_changed?

    if name.present?
      author = Author.find_or_create_author(name)
      self.author_id = author.id
    else
      self.author_id = nil
    end
  end

  def recent_likes(limit = 4)
    Rails.cache.fetch([self, 'recent_likes']) do
      likes.recent.limit(limit)
    end
  end

  private

  def detect_and_set_language
     result = CLD.detect_language(content)
     lang = result[:name].downcase
     lang = 'chinese' if lang == 'chineset'
     self.language = lang
  end

  def find_or_create_author_and_source_wiki
    # do not create wiki for link
    return if source_is_link?
    find_or_create_wiki(:source) if source_wiki_id.blank? && source_changed? && source.present?
  end
end
