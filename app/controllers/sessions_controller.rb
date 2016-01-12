class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate user_params[:email], user_params[:password]

    if @user
      session[:user_id] = @user.id
      print session[:user_id]
      print @user.id
      redirect_to root_path
    else
      # flash[:danger] = "wrong password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
  
end
