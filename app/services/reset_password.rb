class ResetPassword
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def send_password_reset!
    reset_password_token!
    ResetPasswordMailer.send_mail(user).deliver
  end

  def reset_password_token!
    begin
      user.reset_password_token = SecureRandom.urlsafe_base64
    end while User.exists?(reset_password_token: user.reset_password_token)
    user.reset_password_sent_at = Time.now

    user.save!
  end
end