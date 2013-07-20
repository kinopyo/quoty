class UsersController < ApplicationController
  before_filter :require_login, except: :show

  def show
    @user = User.friendly.includes(:quotes).find(params[:id])
    @activities = @user.activities.order('created_at DESC').limit(10)

    respond_to do |format|
      format.html
      format.json { render json: @user.quotes.to_json }
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to @user, notice: t('users.update.success')
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :email, :profile,
      preference_attributes: [:languages])
  end
end
