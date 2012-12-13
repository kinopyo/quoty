# coding: utf-8
class Quote < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: :user, only: [:create], params: {
    summary: proc { |c, m| c.truncate(m.content, length: 100) }
  }

  attr_accessible :content, :language, :name, :source

  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :content, presence: true

  before_create :detect_and_set_language

  def as_json(options = nil)
    super(only: [:name, :content, :source])
  end

  def detect_and_set_language
     result = CLD.detect_language(content)
     self.language = result[:name].downcase# if result[:reliable]
  end

  def language_in_its_own
    case language
    when 'chinese' then '中文'
    when 'japanese' then '日本語'
    when 'english' then 'English'
    end
  end
end
