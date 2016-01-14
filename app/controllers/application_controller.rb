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

    # Hash associating language code, name, and flag (country code)
    @language_hash_flags = {
      :ar => {
        :name => 'Arabic',
        :flag => 'eg'},
      :'bs-Latn' => {
        :name => 'Bosnian (Latin)',
        :flag => 'ba'},
      :bg => {
        :name => 'Bulgarian',
        :flag => 'bg'},
      :'zh-CHS' => {
        :name => 'Chinese Simplified',
        :flag => 'cn'},
      :'zh-CHT' => {
        :name => 'Chinese Traditional',
        :flag => 'cn'},
      :hr => {
        :name => 'Croatian',
        :flag => 'hr'},
      :ca => {
        :name => 'Catalan',
        :flag => 'ad'},
      :cs => {
        :name => 'Czech',
        :flag => 'cz'},
      :da => {
        :name => 'Danish',
        :flag => 'dk'},
      :nl => {
        :name => 'Danish',
        :flag => 'nl'},
      :en => {
        :name => 'English',
        :flag => 'gb'},
      :et => {
        :name => 'Estonian',
        :flag => 'ee'},
      :fi => {
        :name => 'Finnish',
        :flag => 'fi'},
      :fr => {
        :name => 'French',
        :flag => 'fr'},
      :de => {
        :name => 'German',
        :flag => 'de'},
      :el => {
        :name => 'Greek',
        :flag => 'gr'},
      :ht => {
        :name => 'Haitian Creole',
        :flag => 'ht'},
      :he => {
        :name => 'Hebrew',
        :flag => 'il'},
      :hi => {
        :name => 'Hindi',
        :flag => 'in'},
      :mww => {
        :name => 'Hmong Daw',
        :flag => 'la'},
      :hu => {
        :name => 'Hungarian',
        :flag => 'hu'},
      :it => {
        :name => 'Italian',
        :flag => 'it'},
      :ja => {
        :name => 'Japanese',
        :flag => 'jp'},
      :sw => {
        :name => 'Kiswahili',
        :flag => 'tz'},
      :tlh => {
        :name => 'Klingon',
        :flag => 'tk'},
      :'tlh-Qaak' => {
        :name => 'Klingon (pIqaD)',
        :flag => 'tk'},
      :ko => {
        :name => 'Korean',
        :flag => 'kr'},
      :lv => {
        :name => 'Latvian',
        :flag => 'lv'},
      :lt => {
        :name => 'Lithuanian',
        :flag => 'lt'},
      :ms => {
        :name => 'Malay',
        :flag => 'my'},
      :mt => {
        :name => 'Maltese',
        :flag => 'mt'},
      :no => {
        :name => 'Norwegian',
        :flag => 'no'},
      :fa => {
        :name => 'Persian',
        :flag => 'ir'},
      :pl => {
        :name => 'Polish',
        :flag => 'pl'},
      :pt => {
        :name => 'Portuguese',
        :flag => 'pt'},
      :otq => {
        :name => 'Querétaro Otomi',
        :flag => 'mx'},
      :ro => {
        :name => 'Romanian',
        :flag => 'ro'},
      :ru => {
        :name => 'Russian',
        :flag => 'ru'},
      :'sr-Cyrl' => {
        :name => 'Serbian (Cyrillic)',
        :flag => 'rs'},
      :'sr-Latn' => {
        :name => 'Serbian (Latin)',
        :flag => 'rs'},
      :sk => {
        :name => 'Slovak',
        :flag => 'sk'},
      :sl => {
        :name => 'Slovenian',
        :flag => 'si'},
      :es => {
        :name => 'Spanish',
        :flag => 'es'},
      :sv => {
        :name => 'Swedish',
        :flag => 'se'},
      :th => {
        :name => 'Thai',
        :flag => 'th'},
      :tr => {
        :name => 'Turkish',
        :flag => 'tr'},
      :uk => {
        :name => 'Ukrainian',
        :flag => 'ua'},
      :ur => {
        :name => 'Urdu',
        :flag => 'pk'},
      :vi => {
        :name => 'Vietnamese',
        :flag => 'vn'},
      :cy => {
        :name => 'Welsh',
        :flag => 'gb'},
      :yua => {
        :name => 'Yucatec Maya',
        :flag => 'mx'}
    }

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

    # @current_language is a hash with format {:fr => 'French'}
    if current_user
      @current_language = {
        :code => session['user_language']['session_language'],
        :name => @language_hash[session['user_language']['session_language'].to_sym]
      }
    end

    # Array of languages in the format [['French', 'fr'], ...] -- for use in dropdown menus
    @language_array = []
    @language_hash.each do |symbol, name|
      @language_array.push([name, symbol.to_s])
    end

  end

  def language_storage
    
  end

  def disable_navbar
    @disable_navbar = true
  end

end
