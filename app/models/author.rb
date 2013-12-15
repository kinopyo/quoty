class Author < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  has_many :quotes, dependent: :destroy

  # TODO should be able to find author by name or alias, like nickname, etc.
  def self.find_or_create_author(name)
    find_or_create_by(name: name)
  end

  def self.search(term)
    # TODO should be able to find author by name or alias, like nickname. Also
    # should be able to find either lowercase or uppercase.
    Author.where("lower(name) LIKE ?", "%#{term}%")
  end

  # let friendly_id compatible with Japanese and Chinese
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end
end
