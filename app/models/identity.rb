class Identity <OmniAuth::Identity::Models::ActiveRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, allow_blank: true, format:
    { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, confirmation: true, length: { in: 6..20 }
end
