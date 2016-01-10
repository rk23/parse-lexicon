class TranslateController < ApplicationController
  def index

    translator = MicrosoftTranslator::Client.new('01928374', 'Rw8yP/mFE41m/Hp7pPJ4TORa5b4unbsPCIJva7jtKh0=')


    # spanish = "hasta luego muchacha"
    # @trtext = translator.translate(spanish,"es","en","text/html")


    #Grab data from the form on the main page
    @form_data = params.require(:translate).permit(:text, :lang)

    @text = @form_data['text']
    @lang = @form_data
    @counted = count_words @text

    #Sorts by frequency in descending order
    @sorted =  @counted.sort_by {|word, freq| freq}.reverse

    #Gets total word count
    @word_count = @text.split(' ').length

    # @translation = get_translation translator, @text, 'es', 'en'


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

  def get_translation(translator, string, lang_from, lang_to)
    words = parse_text(string)
    translation = Hash.new(0)
    words.each { |word| translation[word.downcase] = translator.translate(word,lang_from,lang_to,"text/html")}
    translation
  end

end
