class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def index
  end

  def current_user
    User.find_by(id: session[:current_user]) # find_by will not throw an error if
                                             # no user is found
  end

  def authenticate
    redirect_to sessions_new_path unless current_user
  end
end
