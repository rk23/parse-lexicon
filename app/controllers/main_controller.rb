class MainController < ApplicationController
	before_action :is_authenticated?
  skip_before_filter :require_login
  
  def index
    @link = Text.all

  	if current_user
      user_words = current_user.words

      word_count_by_lang = Hash.new(0)
      user_words.each do |word|
        word_count_by_lang[word.language] += 1
      end

      @words = word_count_by_lang.sort_by {|key, value| value}.reverse
      render "home"
      
  	else
  		disable_navbar
  		render "welcome"
  	end

  end

  def instructions
    disable_navbar
  end

  def about
    disable_navbar
  end

  def recommended
  end

end
