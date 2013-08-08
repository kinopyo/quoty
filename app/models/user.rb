class User < ActiveRecord::Base
  include PublicActivity::Model
  tracked skip_defaults: true

  extend FriendlyId
  friendly_id :name, use: :slugged
  include FriendlyIdSlugHelper

  has_many :activities, class_name: '::PublicActivity::Activity', as: :owner, dependent: :destroy
  has_many :wikis
  has_many :providers, dependent: :destroy
  has_many :quotes
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :preference, class_name: 'UserPreference'
  accepts_nested_attributes_for :preference

  scope :recent, -> { order("users.created_at DESC") }

  def self.create_with_omniauth(info)
    create(name: info['name'],
      image: info['image'],
      email: info['email'],
      profile: info['description'],
      omniauth_info_updated_at: Time.now)
  end

  def email=(val)
    self.email_md5 = Digest::MD5.hexdigest(val || "")
    self[:email] = val
  end

  def update_info_from_omniauth!(info)
    if omniauth_info_updated_at.nil? || omniauth_info_updated_at > 1.week.ago
      update!(image: info['image'],
        profile: profile || info['description'],
        omniauth_info_updated_at: Time.now)
    end
  end

  def admin?
    is_admin
  end
end
