class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_current_user

  protected

  def set_current_user
    User.current_user = current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    !!current_user
  end
  helper_method :current_user, :signed_in?

  def current_user=(user)
    User.current_user = user
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
end
