class UsersController < ApplicationController
  before_action :is_authenticated?
  skip_before_filter :require_login
  def show
  	@user = User.find params[:id]
  end

  def new
  end

  def create
  	@user = User.create(user_params)

  		if @user.save
  			session[:user_id] = @user.id
        @user_language = @user.user_language.create(user_language_params)
        session[:user_language] = @user_language
        session[:danger] = nil
        redirect_to root_path
      	else
          session[:danger] = 'Missing Input Fields'
      		redirect_to root_path
      	end
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :name)
  end

  def user_language_params
      params.require(:user).permit(:session_language)
  end
  
end
