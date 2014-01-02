require 'spec_helper'

describe ApplicationController do
  controller do
    def index
      render text: 'hello'
    end
  end

  describe "#set_locale" do
    it "sets locale to the one stored in cookie if it's avaialble in the app" do
      cookies[:locale] = :ja
      get :index
      expect(I18n.locale).to eq(:ja)
    end

    it "falls back to the default locale if the one stored in cookie is not avaialble for the app" do
      cookies[:locale] = :es
      get :index
      expect(I18n.locale).to eq(:en)
    end

    it "sets locale to the one extracted from header if cookie is blank" do
      pending 'just does not work'
      request.env['HTTP_ACCEPT_LANGUAGE'] = 'ja-JP,fr-FR;q=0.5'
      get :index
      expect(I18n.locale).to eq(:ja)
    end

    it "stores locale to cookie" do
      expect { get :index }.to change { cookies.permanent[:locale] }.from(nil).to(:en)

      expect { get :index }.not_to change { cookies.permanent[:locale] }
    end

  end
end
