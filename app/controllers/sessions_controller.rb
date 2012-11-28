class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env['omniauth.auth']
    # Find an provider here
    @provider = Provider.find_with_omniauth(auth)

    if @provider.nil?
      # If no provider was found, create a brand new one here
      @provider = Provider.create_with_omniauth(auth)
    end

    if signed_in?
      if @provider.user == current_user
        # User is signed in so they are trying to link an provider with their
        # account. But we found the provider and the user associated with it
        # is the current user. So the provider is already associated with
        # this user. So let's display an error message.
        redirect_to return_path, notice: 'Already linked that account!'
      else
        # The provider is not associated with the current_user so lets
        # associate the provider
        @provider.user = current_user
        @provider.save
        redirect_to return_path, notice: 'Successfully linked that account!'
      end
    else
      if @provider.user.present?
        # The provider we found had a user associated with it so let's
        # just log them in here
        self.current_user = @provider.user
        redirect_to return_path, notice: 'Signed in!'
      else
        # No user associated with the provider so we need to create a new one
        # redirect_to new_user_url, notice: 'Please finish registering'
        self.current_user = User.create_with_omniauth(auth['info'])
        @provider.user = current_user
        @provider.save
        redirect_to return_path, notice: 'Signed in!'
      end
    end
  end

  def destroy
    self.current_user = nil
    redirect_to root_url, notice: 'Signed out!'
  end

  def failure
    redirect_to login_path, alert: 'Sorry, could not log you in...'
  end

  private

  def return_path
    session.delete(:return_to) || root_url
  end
end