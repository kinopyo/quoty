class Wiki < ActiveRecord::Base
  has_ancestry

  belongs_to :user

  validates :title, presence: true

  def self.case_insensitive_search(title)
    where("lower(title) = ?", title.downcase)
  end
end
