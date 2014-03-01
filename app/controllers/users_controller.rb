class UsersController < ApplicationController
  before_filter :require_login, only: [:edit, :update]

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

  def quotes
    @user = User.friendly.find(params[:id])
    @quotes = @user.quotes.recent.page(params[:page])

    respond_to do |format|
      format.html
      format.js { render 'quotes/index' }
    end
  end

  def likes
    @user = User.friendly.find(params[:id])
    @quotes = @user.liked_quotes.with_associations.recent.page(params[:page])

    respond_to do |format|
      format.html
      format.js { render 'quotes/index' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :email, :profile,
      preference_attributes: [:languages])
  end
end
