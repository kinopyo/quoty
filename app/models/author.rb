class Author < ActiveRecord::Base
  has_many :quotes, dependent: :destroy

  # TODO should be able to find author by name or alias, like nickname, etc.
  def self.find_or_create_author(name)
    find_or_create_by(name: name)
  end
end
