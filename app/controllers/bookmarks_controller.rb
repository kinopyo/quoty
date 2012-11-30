class BookmarksController < ApplicationController
  before_filter :require_login

  def create
    @bookmark = current_user.bookmarks.new
    @bookmark.quote = Quote.find(params[:quote_id])
    if @bookmark.save
      redirect_to @bookmark.quote, notice: t(:'bookmarks.create.success')
    else
      redirect_to @bookmark.quote, alert: t(:'bookmarks.create.failure')
    end
  end

  def destroy

  end
end
