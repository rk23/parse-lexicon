
class SessionsController < ApplicationController
  skip_before_filter :require_login
  def new
  end

  def create
    @user = User.authenticate user_params[:email], user_params[:password]

    if @user
      session[:user_id] = @user.id
      @user_language = current_user.user_language.create(user_language_params)
      session[:user_language] = @user_language
      redirect_to root_path
    else
      # flash[:danger] = "wrong password"
      redirect_to root_path
    end

  end

  def update

    if params[:user_language]
      language = params[:user_language]

      language_code = ''
      # The only thing I can get from this response is full language name
      # so I iterate through the language hash, find where the language code
      # is equal to the language name, then set that key value as the lang code
      @lang_hash.each do |key_value|
        if language == key_value[1][:name]
          language_code = key_value[0]
          break
        end
      end
    else
      language_code = params[:user_language_symbol]
    end

    session['user_language']['session_language'] = language_code
    render json: @lang_hash[language_code]
  end


  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
  
  def user_language_params
      params.require(:user).permit(:session_language)
  end
  
end
