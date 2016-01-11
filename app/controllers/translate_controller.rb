class TranslateController < ApplicationController
  def index

    #Uses microsoft-translator gem
    #Need to change these to ENV variables!
    translator = MicrosoftTranslator::Client.new('01928374', 'Rw8yP/mFE41m/Hp7pPJ4TORa5b4unbsPCIJva7jtKh0=')

    #Grab data from the form on the main page
    @form_data = params.require(:translate).permit(:text, :lang)
    @text = @form_data['text']

    #Counts frequency and stores in hash
    @parsed_and_sorted = count_words @text
    @parsed = parse_text @text
    @word_count = @parsed.length

    # Get the translation hash
    @translation = get_translation translator, @parsed_and_sorted, 'es', 'en'
  end

  private

  def parse_text(string)
    words = string.gsub(/(?!')[[:punct:]]/, "").split(' ')
    words
  end

  def count_words(string)
    words = parse_text(string)
    frequency = Hash.new(0)
    words.each { |word| frequency[word.downcase] += 1 }
    frequency.sort_by {|word, freq| freq}.reverse
  end

  def get_translation(translator, hash, lang_from, lang_to)
    translation = Hash.new(0)

    # translator.translate(word[0],lang_from,lang_to,"text/html")
    #Iterate over the hash and store both word count and translation
    #so both are accessible
    hash.each do |word|
        translation[word[0]] = {count: word[1],
                                translation: ""}
    end

    translation
  end

end