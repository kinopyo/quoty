class ResetPasswordMailer < ActionMailer::Base
  default from: 'no_reply@quoty.me'

  def send_mail(user)
    @user = user

    mail to: @user.email
  end
end
