class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_authenticated?
    unless current_user
      flash[:danger] = "Credentials invalid"
      # redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def lang
    # hash associating language codes and language names (and flags?)
  end

  def disable_nav
    @disable_nav = true
  end

end
