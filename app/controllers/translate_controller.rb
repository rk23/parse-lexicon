class TranslateController < ApplicationController
  def index
    #Grab data from the form on the main page
    @form_data = params.require(:translate).permit(:text)
    @text = @form_data['text']

    @counted = count_words @text

    #Sorts by frequency in descending order
    @sorted =  @counted.sort_by {|word, freq| freq}.reverse

    #Gets total word count
    @word_count = @text.split(' ').length


  end

  private

  def count_words(string)
    words = string.split(' ')
    frequency = Hash.new(0)
    words.each { |word| frequency[word.downcase] += 1 }
    return frequency
  end

end
