class User < ActiveRecord::Base
  include PublicActivity::Model
  tracked skip_defaults: true
  has_many :activities, class_name: 'PublicActivity::Activity', as: :owner, dependent: :destroy

  attr_accessible :name, :image, :email, :profile, :preference_attributes

  has_many :providers, dependent: :destroy
  has_many :quotes
  has_many :bookmarks, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_one :preference, class_name: 'UserPreference'
  accepts_nested_attributes_for :preference

  scope :recent, -> { order("users.created_at DESC") }

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.create_with_omniauth(info)
    create(name: info['name'], image: info['image'], email: info['email'])
  end
end
