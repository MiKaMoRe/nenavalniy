class ApplicationController < ActionController::Base
  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      @messages = ["You're not authorized"]
      render template: 'users/sessions/authenticate_failure'
    end
  end
end
