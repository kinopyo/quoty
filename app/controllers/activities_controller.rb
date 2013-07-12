class ActivitiesController < ApplicationController
  def index
    @user = User.friendly.find(params[:user_id])
    @activities = @user.activities.order('created_at DESC').limit(10)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
