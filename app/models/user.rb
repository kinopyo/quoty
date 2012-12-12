class User < ActiveRecord::Base
  include PublicActivity::Activist
  activist

  attr_accessible :name, :image, :email, :profile, :preference_attributes

  has_many :providers, dependent: :destroy
  has_many :quotes
  has_many :bookmarks, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_one :preference, class_name: 'UserPreference'
  accepts_nested_attributes_for :preference

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.create_with_omniauth(info)
    create(name: info['name'], image: info['image'], email: info['email'])
  end
end
