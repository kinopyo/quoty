class UserObserver < ActiveRecord::Observer
  def after_create(user)
    user.create_activity key: "user.create", owner: user
  end
end
