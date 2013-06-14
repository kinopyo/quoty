module Api::V1
  class QuotesController < ApplicationController
    respond_to :json

    def index
      respond_with Quote.where(language: language).recent.page(params[:page])
    end

    def show
      respond_with Quote.find(params[:id])
    end

    private

    def language
      params[:language] || default_language
    end

    def default_language
      'english'
    end
  end
end
