class MainController < ApplicationController
	before_action :is_authenticated?
  
  def index
    @link = Text.all
  	# If user is not logged in, disable navbar and display welcome view instead of home view
  	if current_user
      user_words = current_user.words

      @sorted_words = Hash.new(0)
      user_words.each do |word|
        @sorted_words[word.language] += 1
      end

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
