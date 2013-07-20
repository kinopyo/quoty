class AuthorsController < ApplicationController
  def show
    @author = Author.friendly.find(params[:id])
  end

  def search
    @authors = Author.search(params[:query])
    render json: @authors.as_json(only: [:id, :name])
  end
end
