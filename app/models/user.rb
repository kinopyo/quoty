class User < ActiveRecord::Base
  attr_accessible :name, :image, :email

  has_many :providers, dependent: :destroy
  has_many :quotes
  has_many :bookmarks, dependent: :destroy
  has_many :votes, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.create_with_omniauth(info)
    create(name: info['name'], image: info['image'], email: info['email'])
  end

  # http://stackoverflow.com/questions/2513383/access-current-user-in-model
  def self.current_user
    Thread.current[:current_user]
  end

  def self.current_user=(user)
    Thread.current[:current_user] = user
  end
end
