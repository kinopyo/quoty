class AuthorsController < ApplicationController
  def search
    # TODO should be able to find author by name or alias, like nickname. Also
    # should be able to find either lowercase or uppercase.
    @authors = Author.where("name LIKE ?", "%#{params[:query]}%")
    render json: @authors.as_json(only: [:id, :name])
  end
end
