class Author < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :quotes, dependent: :destroy

  # TODO should be able to find author by name or alias, like nickname, etc.
  def self.find_or_create_author(name)
    find_or_create_by(name: name)
  end

  # let friendly_id compatible with Japanese and Chinese
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end
end
