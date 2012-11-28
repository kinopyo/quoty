class QuotesController < ApplicationController
  before_filter :require_login, except: [:index, :show, :language]

  def index
    @quotes = Quote.order('created_at DESC')
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def new
    @quote = current_user.quotes.new
  end

  def create
    @quote = current_user.quotes.new(params[:quote])
    if @quote.save
      redirect_to @quote, notice: 'created.'
    else
      render 'new'
    end
  end

  def edit
    @quote = current_user.quotes.find(params[:id])
  end

  def update
    @quote = current_user.quotes.find(params[:id])

    if @quote.update_attributes(params[:quote])
      redirect_to @quote, notice: 'updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @quote = current_user.quotes.find(params[:id])

    if @quote.destroy
      redirect_to root_url, notice: 'destroyed.'
    end
  end

  def language
    @quotes = Quote.where(language: params[:language])
  end
end
