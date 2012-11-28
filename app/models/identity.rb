class Identity <OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :name, :email, :password, :password_confirmation

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, allow_blank: true, format:
    { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
end
