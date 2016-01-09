class TranslateController < ApplicationController
  def index
    @sink = params.require(:translate).permit(:text)
    @text = @sink['text']

    @freq = count_words @text
    @sorted =  @freq.sort_by {|word, freq| freq}.reverse


  end

  private

  def count_words(string)
    words = string.split(' ')
    frequency = Hash.new(0)
    words.each { |word| frequency[word.downcase] += 1 }
    return frequency
  end

end
