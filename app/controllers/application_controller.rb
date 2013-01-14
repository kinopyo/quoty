class ApplicationController < ActionController::Base
  protect_from_forgery

  include PublicActivity::StoreController
  include ActionView::Helpers::TextHelper

  before_filter :set_locale_and_language
  before_filter :enable_profiler_for_admin

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  protected

  def signed_in?
    !!current_user
  end
  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.nil? ? user : user.id
  end

  def require_login
    unless signed_in?
      respond_to do |format|
        format.html do
          session[:return_to] = request.path
          redirect_to login_path, alert: 'You must be logged in to access this section.'
        end

        format.js { render template: 'shared/require_login', locals: { message: require_login_message } }
        format.json { head :unauthorized }
      end
    end
  end

  # can override this in each controller
  def require_login_message
    "That action needs to login."
  end

  def set_locale_and_language
    return unless request.env['HTTP_ACCEPT_LANGUAGE']

    language_short = extract_locale_from_accept_language_header
    I18n.locale = language_short
    language_full = case language_short
      when 'zh' then 'chinese'
      when 'ja' then 'japanese'
      else 'english'
    end

    if signed_in?
      if current_user.preference.try(:languages).blank?
        current_user.create_preference(languages: language_full)
      end
    else
      cookies[:languages] = language_full if cookies[:languages].blank?
    end
  end

  def current_user_languages
    if current_user.try(:preference).try(:languages).present?
      current_user.preference.languages
    else
      cookies[:languages]
    end
  end

  private

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

  def enable_profiler_for_admin
    Rack::MiniProfiler.authorize_request if current_user.try(:admin?)
  end
end
