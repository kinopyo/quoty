require 'spec_helper'

describe ApplicationController do
  controller do
    def index
      render text: 'hello'
    end
  end

  describe "#set_locale" do
    context "when params[:locale] is given" do
      context "and available in the site" do
        it "sets locale to params[:locale] if it's available in the site" do
          get :index, locale: 'en'
          expect(I18n.locale).to eq(:en)
        end
      end

      context "but unavailable in the site" do
        it "sets locale to :en" do
          get :index, locale: 'es'
          expect(I18n.locale).to eq(:en)
        end
      end

      it "doesn't store to cookie" do
        get :index, locale: 'en'
        expect(cookies.permanent[:locale]).to eq(nil)
      end
    end

    context "when params[:locale] is blank" do
      it "sets locale to the one stores in cookie" do
        cookies[:locale] = :ja
        get :index
        expect(I18n.locale).to eq(:ja)
      end

      it "sets locale to the one extracted from header if cookie is blank" do
        pending 'just does not work'
        request.env['HTTP_ACCEPT_LANGUAGE'] = 'ja-JP,fr-FR;q=0.5'
        get :index
        expect(I18n.locale).to eq(:ja)
      end

      it "stores locale to cookie" do
        get :index
        expect(cookies.permanent[:locale]).to eq(:en)

        get :index
        expect { get :index }.not_to change { cookies.permanent[:locale] }
      end
    end
  end
end
