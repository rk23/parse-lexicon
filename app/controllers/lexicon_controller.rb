class LexiconController < ApplicationController
  def index
    @language = params[:lang]

    language_code = ''
    # The only thing I can get from this response is full language name
    # so I iterate through the language hash, find where the language code
    # is equal to the language name, then set that key value as the lang code

    # can consolidate with same function in sessions controller
    @lang_hash.each do |key_value|
      if @language == key_value[1][:name]
        language_code = key_value[0]
        break
      end
    end

    @user_words = current_user.words.where(language: language_code).order(:understood_word)

    # Get word count for learned languages 
    user_word_list = current_user.words
    
    word_count_by_lang = Hash.new(0)
    user_word_list.each do |word|
      word_count_by_lang[word.language] += 1
    end

    @words = word_count_by_lang.sort_by {|key, value| value}.reverse
  end

  def delete
    word_id = params[:id]
    current_user.words.delete(word_id)
    render json: "deleted"
  end
end
