class Provider < ActiveRecord::Base
  belongs_to :user
  belongs_to :identity, dependent: :destroy, foreign_key: :uid

  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, scope: :provider

  def self.find_with_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end

  def self.create_with_omniauth(auth)
    create(uid: auth['uid'], provider: auth['provider'], image: auth['info']['image'])
  end
end
