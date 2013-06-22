class UserSweeper < ActionController::Caching::Sweeper
  observe User

  def after_create(user)
    binding.pry
    expire_fragment('recent_joined_users')
  end
end
