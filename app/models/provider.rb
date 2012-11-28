class Provider < ActiveRecord::Base
  attr_accessible :provider, :uid, :image

  belongs_to :user
  has_one :identity, conditions: "provider = 'identity'", dependent: :destroy

  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, scope: :provider

  def self.find_with_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end

  def self.create_with_omniauth(auth)
    create(uid: auth['uid'], provider: auth['provider'], image: auth['info']['image'])
  end
end
