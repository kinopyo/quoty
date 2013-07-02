class ApplicationController < ActionController::Base
  prepend_before_filter :stub_current_user

  def stub_current_user
    session[:user_id] = cookies[:stub_user_id] if cookies[:stub_user_id]
  end
end
