class AuthenticateFailure < Devise::FailureApp
  def respond
    redirect_to user_session_path
  end
end
