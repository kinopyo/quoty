class ResetPasswordsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:reset_password][:email]).first
    ResetPassword.new(user).send_password_reset! if user
    redirect_to root_path, notice: I18n.t('reset_passwords.create')
  end

  def edit
    @user = User.find_by_reset_password_token!(params[:id])
  end

  def update
    @user = User.find_by_reset_password_token!(params[:id])

    if @user.reset_password_sent_at < 2.hours.ago
      redirect_to new_reset_password_path, alert: I18n.t('reset_passwords.expired')
    else
      # TODO user.identity association
      @identity = Identity.find_by_email!(@user.email)
      # TODO maybe also reset token..?

      if @identity.update(identity_params)
        self.current_user = @user
        redirect_to root_path, notice: I18n.t('reset_passwords.success')
      else
        render :edit
      end
    end
  end

  private

  def identity_params
    params.require(:identity).permit(:password, :password_confirmation)
  end
end
