class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Allows use of language list and conversion between language name and symbol
  before_action :access_languages

  def is_authenticated?
    unless current_user
      flash[:danger] = "Credentials invalid"
      # redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def access_languages

    # Can be used anywhere! It's a string.
    if current_user
      @current_language = session['user_language']['session_language']
    end

    # Hash associating language codes and language names
    @language_hash = {
      :fr => 'French',
      :es => 'Spanish',
      :de => 'German',
      :it => 'Italian',
      # Resorted so that above languages will show up at top of dropdown menu
      :ar => 'Arabic',
      :'bs-Latn' => 'Bosnian (Latin)',
      :bg => 'Bulgarian',
      :ca => 'Catalan',
      :'zh-CHS' => 'Chinese Simplified',
      :'zh-CHT' => 'Chinese Traditional',
      :hr => 'Croatian',
      :cs => 'Czech',
      :da => 'Danish',
      :nl => 'Dutch',
      :en => 'English',
      :et => 'Estonian',
      :fi => 'Finnish',
      :el => 'Greek',
      :ht => 'Haitian Creole',
      :he => 'Hebrew',
      :hi => 'Hindi',
      :mww => 'Hmong Daw',
      :hu => 'Hungarian',
      :id => 'Indonesian',
      :ja => 'Japanese',
      :sw => 'Kiswahili',
      :tlh => 'Klingon',
      :'tlh-Qaak' => 'Klingon (pIqaD)',
      :ko => 'Korean',
      :lv => 'Latvian',
      :lt => 'Lithuanian',
      :ms => 'Malay',
      :mt => 'Maltese',
      :no => 'Norwegian',
      :fa => 'Persian',
      :pl => 'Polish',
      :pt => 'Portuguese',
      :otq => 'Querétaro Otomi',
      :ro => 'Romanian',
      :ru => 'Russian',
      :'sr-Cyrl' => 'Serbian (Cyrillic)',
      :'sr-Latn' => 'Serbian (Latin)',
      :sk => 'Slovak',
      :sl => 'Slovenian',
      :sv => 'Swedish',
      :th => 'Thai',
      :tr => 'Turkish',
      :uk => 'Ukrainian',
      :ur => 'Urdu',
      :vi => 'Vietnamese',
      :cy => 'Welsh',
      :yua => 'Yucatec Maya'
    }
    @language_hash_alpha = {
      :ar => 'Arabic',
      :'bs-Latn' => 'Bosnian (Latin)',
      :bg => 'Bulgarian',
      :ca => 'Catalan',
      :'zh-CHS' => 'Chinese Simplified',
      :'zh-CHT' => 'Chinese Traditional',
      :hr => 'Croatian',
      :cs => 'Czech',
      :da => 'Danish',
      :nl => 'Dutch',
      :en => 'English',
      :et => 'Estonian',
      :fi => 'Finnish',
      :fr => 'French',
      :de => 'German',
      :el => 'Greek',
      :ht => 'Haitian Creole',
      :he => 'Hebrew',
      :hi => 'Hindi',
      :mww => 'Hmong Daw',
      :hu => 'Hungarian',
      :id => 'Indonesian',
      :it => 'Italian',
      :ja => 'Japanese',
      :sw => 'Kiswahili',
      :tlh => 'Klingon',
      :'tlh-Qaak' => 'Klingon (pIqaD)',
      :ko => 'Korean',
      :lv => 'Latvian',
      :lt => 'Lithuanian',
      :ms => 'Malay',
      :mt => 'Maltese',
      :no => 'Norwegian',
      :fa => 'Persian',
      :pl => 'Polish',
      :pt => 'Portuguese',
      :otq => 'Querétaro Otomi',
      :ro => 'Romanian',
      :ru => 'Russian',
      :'sr-Cyrl' => 'Serbian (Cyrillic)',
      :'sr-Latn' => 'Serbian (Latin)',
      :sk => 'Slovak',
      :sl => 'Slovenian',
      :es => 'Spanish',
      :sv => 'Swedish',
      :th => 'Thai',
      :tr => 'Turkish',
      :uk => 'Ukrainian',
      :ur => 'Urdu',
      :vi => 'Vietnamese',
      :cy => 'Welsh',
      :yua => 'Yucatec Maya'
    }

    # Array of languages in the format [['French', 'fr'], ...] -- for use in dropdown menus
    @language_array = []
    @language_hash.each do |symbol, name|
      @language_array.push([name, symbol.to_s])
    end

    @language_array_alpha = []
    @language_hash_alpha.each do |symbol, name|
      @language_array_alpha.push([name, symbol.to_s])
    end

  end

  def disable_navbar
    @disable_navbar = true
  end

end
