class LexiconController < ApplicationController
  def index
    @user_words = current_user.words.order(:understood_word)
  end

  def delete
    word_id = params[:id]
    current_user.words.delete(word_id)
    render json: "deleted"
  end
end
