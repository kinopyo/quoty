class User < ActiveRecord::Base
  attr_accessible :name, :image

  has_many :identities, dependent: :destroy

  def self.create_with_omniauth(info)
    create(name: info['name'], image: info['image'])
  end
end
