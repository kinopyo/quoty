# coding: utf-8
class Quote < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: :user, only: [:create], params: {
    summary: proc { |c, m| c.truncate(m.content, length: 100) }
  }

  attr_accessible :content, :language, :author, :source, :context, :photos_attributes, :author_wiki_id, :source_wiki_id

  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :photos, dependent: :destroy
  belongs_to :author_wiki, class_name: 'Wiki', foreign_key: :author_wiki_id
  belongs_to :source_wiki, class_name: 'Wiki', foreign_key: :source_wiki_id
  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: :all_blank

  validates :content, presence: true

  before_create :detect_and_set_language

  def as_json(options = nil)
    super(only: [:author, :content, :source])
  end

  def detect_and_set_language
     result = CLD.detect_language(content)
     self.language = result[:name].downcase# if result[:reliable]
  end

  def language_in_its_own
    case language
    when 'chinese' then '中文'
    when 'japanese' then '日本語'
    else language.capitalize
    end
  end
end
