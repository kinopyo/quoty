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
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to current_user, notice: t(:'bookmarks.destroy.done')
  end
end
