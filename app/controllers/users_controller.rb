class UsersController < ApplicationController
  def show
  	@user = User.find params[:id]
  end

  def new
  end

  def create
  	@user = User.create(user_params)

  		if @user.save
  			session[:user_id] = @user_id
  			# flash[:success] = "User created"
      		redirect_to root_path
      	else
      		# flash[:danger] = "Credentials invalid"
      		redirect_to "/signup"
      	end
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :name)
  end
  
end