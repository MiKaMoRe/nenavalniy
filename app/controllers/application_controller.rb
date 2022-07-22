class ApplicationController < ActionController::Base
  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      @messages = ["You're not authorized"]
      flash[:alert] = "You're not authorized"

      respond_to do |f|
        f.js { render template: 'users/sessions/authenticate_failure' }
        f.html { redirect_to root_path }
      end
    end
  end
end
