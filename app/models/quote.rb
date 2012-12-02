# coding: utf-8
class Quote < ActiveRecord::Base
  attr_accessible :content, :language, :name, :source

  belongs_to :user
  has_many :votes

  validates :content, presence: true

  before_create :detect_and_set_language

  def as_json(options = nil)
    super(only: [:name, :content, :source])
  end

  def detect_and_set_language
     result = CLD.detect_language(content)
     self.language = result[:name].downcase if result[:reliable]
  end

  def language_in_its_own
    case language
    when 'chinese' then '中文'
    when 'japanese' then '日本語'
    when 'english' then 'English'
    end
  end

  def update_score
    # This might not be the best way to do it, please feel
    # free to refactor!
    total_score = 0
    votes.each do |vote|
      total_score += vote.score
    end
    self.score = total_score
    save!
  end

  def my_vote
    if User.current_user.present?
      votes.where(user_id: User.current_user.id).first
    else
      nil
    end
  end
end
