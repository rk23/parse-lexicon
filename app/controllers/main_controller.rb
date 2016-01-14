class MainController < ApplicationController
	before_action :is_authenticated?
  
  def index
    @link = Text.all
  	# If user is not logged in, disable navbar and display welcome view instead of home view
  	if current_user
  		render "home"
  	else
  		disable_navbar
  		render "welcome"
  	end


  end

  def about
  end

  def recommended
  end

end
