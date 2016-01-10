class TranslateController < ApplicationController
  def index

    #Uses microsoft-translator gem
    translator = MicrosoftTranslator::Client.new('01928374', 'Rw8yP/mFE41m/Hp7pPJ4TORa5b4unbsPCIJva7jtKh0=')

    #Grab data from the form on the main page
    @form_data = params.require(:translate).permit(:text, :lang)

    @text = @form_data['text']
    @counted = count_words @text

    #Gets total word count
    @word_count = @text.split(' ').length

    #Sorts by frequency in descending order and returns a hash
    @sorted =  @counted.sort_by {|word, freq| freq}.reverse

    # @translation = get_translation translator, @text, 'es', 'en'
     @translation = get_translation translator, @sorted, 'es', 'en'


  end

  private

  def parse_text(string)
    words = string.gsub!(/[^\p{Alnum}]/, ' ').split(' ')
    words
  end

  def count_words(string)
    words = parse_text(string)
    frequency = Hash.new(0)
    words.each { |word| frequency[word.downcase] += 1 }
    frequency
  end

  def get_translation(translator, hash, lang_from, lang_to)
    translation = Hash.new(0)

    #Iterate over the hash and store both word count and translation
    #so both are accessible
    hash.each do |word|
        translation[word[0]] = {count: word[1],
                                translation: translator.translate(word[0],lang_from,lang_to,"text/html")}
    end
    translation
  end

end
