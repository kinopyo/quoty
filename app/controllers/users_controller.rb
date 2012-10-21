class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html {  }
      format.json { render json: @user.quotes.to_json }
    end
  end
end