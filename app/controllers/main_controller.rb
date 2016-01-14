class MainController < ApplicationController
	before_action :is_authenticated?
  
  def index
    @link = Text.all

  	if current_user
      user_words = current_user.words

      @word_count_by_lang = Hash.new(0)
      user_words.each do |word|
        @word_count_by_lang[word.language] += 1
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
