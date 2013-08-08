class LikesController < ApplicationController
  before_filter :require_login

  def like
    @quote = Quote.find(params[:quote_id])
    @like = current_user.likes.where(quote_id: @quote).first
    if @like
      @like.destroy
    else
      @like = current_user.likes.create!(quote: @quote)
    end
  end

  private

  def require_login_message
    "To like a quote you need to login."
  end
end
