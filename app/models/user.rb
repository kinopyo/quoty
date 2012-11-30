class User < ActiveRecord::Base
  attr_accessible :name, :image, :email

  has_many :providers, dependent: :destroy
  has_many :quotes
  has_many :bookmarks, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.create_with_omniauth(info)
    create(name: info['name'], image: info['image'], email: info['email'])
  end
end
