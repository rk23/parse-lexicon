class ParseController < ApplicationController
  def index

    # Uses microsoft-translator gem
    # translator = MicrosoftTranslator::Client.new(ENV['MS_TRANSLATOR_KEY'], ENV['MS_TRANSLATOR_SECRET'])

    #scrape from the guttenberg sent from text index
    @text = params[:text][:text]
    url = @text
    response = RestClient.get url
    html = response.body
    data = Nokogiri::HTML(html, nil, 'UTF-8')

    @show = data.css('body')

    if @show
      text = @show.to_s
    else 
      form_data = params.require(:parse).permit(:text, :lang)
      text = form_data['text']
    end

    # Grab data from the form on the main page
    
    

    # Removes punctuation from text, puts into an array
    @parsed = parse_text text
    @word_count = @parsed.length

    # Counts frequency and stores in hash
    @parsed_and_sorted = count_words text

    if current_user
      # Grabs the reference values/collection of the user's words
      words_ref_value = current_user.words

      # Grabs the text word value from the collection, and put it in its own array
      @user_known_words = []
      words_ref_value.each do |word|
        @user_known_words << word.understood_word
      end

      @user_word_count = 0.0
      # New hash for words that the user doesn't know, with frequency data
      @parsed_sorted_and_compared = Hash.new(0)
      @parsed_and_sorted.each do |key_value_pair|

          # If the user's known words does not include the word from the text, then
          # put it in an array we can access on the front end
          if @user_known_words.exclude? key_value_pair[0]
            @parsed_sorted_and_compared[key_value_pair[0]] = key_value_pair[1]
            @user_word_count += key_value_pair[1]
          end

      end

      # Percentage of text known based on user vocab
      @percentage = get_percentage @user_word_count, @word_count

      # Ratio of unique words
      @ratio = 0.0
      @ratio = get_percentage @parsed_sorted_and_compared.length, @parsed_and_sorted.length
    end

    # Get the translation hash
    # @translation = get_translation translator, @parsed_and_sorted, 'es', 'en'
  end

  def create
    @new_word = render json: params[:word]
    # Not finding, always creating but ok for now
    current_user.words.find_or_create_by(understood_word: @new_word[0],
                                         language: @current_language)
  end



  private

  def get_percentage num1, num2
    per = ((1 - (num1.to_f / num2.to_f)) * 100).round(2)
    per
  end

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
    # Iterate over the hash and store both word count and translation so both are accessible
    hash.each do |word|
        translation[word[0]] = {count: word[1],
                                translation: ""}
    end
    translation
  end

  def word_params
    params.require(:word).permit(:understood_word, :languge)
  end

end