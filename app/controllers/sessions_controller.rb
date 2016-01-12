class SessionsController < ApplicationController
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
      redirect_to login_path
    end

     #gets user language and saves it
    
      # if @user_language.save
      #   # session[:user_id] = @user_id
      #   print "got it"
      # else
      #   print "did not save"
      # end

  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
  def user_language_params
      params.require(:user).permit(:session_language)
  end
  
end
