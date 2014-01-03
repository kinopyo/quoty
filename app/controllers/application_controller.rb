class ApplicationController < ActionController::Base
  protect_from_forgery

  include PublicActivity::StoreController
  include ActionView::Helpers::TextHelper

  before_filter :set_locale
  before_filter :enable_profiler_for_admin
  before_filter :set_browser_type

  helper_method :current_user, :signed_in?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  protected

  def signed_in?
    !!current_user
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.nil? ? user : user.id
  end

  def require_login
    return if signed_in?

    respond_to do |format|
      format.html do
        session[:return_to] = request.path
        redirect_to login_path, alert: 'You must be logged in to access this section.'
      end

      format.js { render template: 'shared/require_login', locals: { message: require_login_message } }
      format.json { head :unauthorized }
    end
  end

  # can override this in each controller
  def require_login_message
    "That action needs to login."
  end

  def set_locale
    I18n.locale = (Array(cookies[:locale]) & I18n.available_locales).first ||
                  (Array(extract_locale_from_accept_language_header) & I18n.available_locales.map(&:to_s)).first ||
                  I18n.default_locale

    cookies.permanent[:locale] = I18n.locale unless I18n.locale.to_s == cookies[:locale]
  end

  def current_user_languages
    if params[:locale].present?
      extract_language_from_locale(params[:locale])
    elsif current_user.try(:preference).try(:languages).present?
      current_user.preference.languages
    else
      extract_language_from_locale(cookies[:locale])
    end
  end

  def extract_locale_from_accept_language_header
    return if request.env['HTTP_ACCEPT_LANGUAGE'].blank?

    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

  def extract_language_from_locale(locale)
    case locale.to_s
    when 'ja'
      'japanese'
    when 'zh'
      'chinese'
    else
      'english'
    end
  end

  def set_browser_type
    @browser_type = detect_browser
  end

  def default_url_options(options = {})
    { locale: params[:locale] }
  end

  private

  def enable_profiler_for_admin
    Rack::MiniProfiler.authorize_request if current_user.try(:admin?)
  end

  MOBILE_BROWSERS = %w(playbook windows phone android ipod iphone opera mini blackberry palm hiptop avantgo plucker xiino blazer elaine windows ce; ppc; windows ce; smartphone; windows ce; iemobile up.browser up.link mmp symbian smartphone midp wap vodafone o2 pocket kindle mobile pda psp treo)

  def detect_browser
    agent = request.headers['HTTP_USER_AGENT']
    return 'desktop' unless agent

    MOBILE_BROWSERS.each do |m|
      return 'mobile' if agent.downcase.match(m)
    end

    'desktop'
  end
end
