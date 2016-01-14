class MainController < ApplicationController
	before_action :is_authenticated?
  
  def index
    @link = Text.all
  	# If user is not logged in, disable navbar and display welcome view instead of home view
  	if current_user
      user_words = current_user.words


      @word_count_sorted_by_language = Hash.new(0)
      user_words.each do |word|
        @word_count_sorted_by_language[word.language] += 1
        # @word_count_sorted_by_language looks like: {"ar"=>5, "da"=>8, ...}
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
