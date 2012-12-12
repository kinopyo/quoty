class ActivitiesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @activities = @user.activities.order('created_at DESC')

    respond_to do |format|
      format.html
      format.js
    end
  end
end