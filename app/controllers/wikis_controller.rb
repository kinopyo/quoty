class WikisController < ApplicationController
  before_filter :require_login, except: [:index, :show, :search]

  def index
    @wikis = Wiki.order('created_at DESC')
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = current_user.wikis.new
  end

  def create
    @wiki = current_user.wikis.new(params[:wiki])
    if @wiki.save
      redirect_to @wiki, notice: 'created.'
    else
      render 'new'
    end
  end

  def edit
    @wiki = current_user.wikis.find(params[:id])
  end

  def update
    @wiki = current_user.wikis.find(params[:id])

    if @wiki.update_attributes(params[:wiki])
      redirect_to @wiki, notice: 'updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @wiki = current_user.wikis.find(params[:id])

    if @wiki.destroy
      redirect_to wikis_path, notice: 'destroyed.'
    end
  end

  def search
    @wikis = Wiki.where("title LIKE ?", "%#{params[:query]}%")
    render json: @wikis.as_json(only: [:id, :title])
  end
end
