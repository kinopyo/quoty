class UserPreference < ActiveRecord::Base
  attr_accessible :languages, :locale

  belongs_to :user
end
