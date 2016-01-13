class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Allows use of language list and conversion between language name and symbol
  before_action :access_languages

  def is_authenticated?
    unless current_user
      flash[:danger] = "Credentials invalid"
      # redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def access_languages

    # Can be used anywhere! It's a string.
    @current_language = session['user_language']['session_language']

    # Hash associating language codes and language names
      # To get current language name, use: @language_hash[@current_language.to_sym]
      # Working, but incomplete list
    @language_hash = {
      :en => 'English',
      :bg => 'Bulgarian',
      :ca => 'Catalan'
    }

    # Array of languages in the format [['French', 'fr'], ...] -- for use in dropdown menus
    @language_array = []
    @language_hash.each do |symbol, name|
      @language_array.push([name, symbol.to_s])
    end

  end

  def disable_navbar
    @disable_navbar = true
  end

end
