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
    # Hash containing language code, name, and flag (country code)
    @lang_hash = {
      'ar' => {
        :name => 'Arabic',
        :flag => 'eg'},
      'bs-Latn' => {
        :name => 'Bosnian (Latin)',
        :flag => 'ba'},
      'bg' => {
        :name => 'Bulgarian',
        :flag => 'bg'},
      'zh-CHS' => {
        :name => 'Chinese Simplified',
        :flag => 'cn'},
      'zh-CHT' => {
        :name => 'Chinese Traditional',
        :flag => 'cn'},
      'hr' => {
        :name => 'Croatian',
        :flag => 'hr'},
      'ca' => {
        :name => 'Catalan',
        :flag => 'ad'},
      'cs' => {
        :name => 'Czech',
        :flag => 'cz'},
      'da' => {
        :name => 'Danish',
        :flag => 'dk'},
      'nl' => {
        :name => 'Dutch',
        :flag => 'nl'},
      'en' => {
        :name => 'English',
        :flag => 'gb'},
      'et' => {
        :name => 'Estonian',
        :flag => 'ee'},
      'fi' => {
        :name => 'Finnish',
        :flag => 'fi'},
      'fr' => {
        :name => 'French',
        :flag => 'fr'},
      'de' => {
        :name => 'German',
        :flag => 'de'},
      'el' => {
        :name => 'Greek',
        :flag => 'gr'},
      'ht' => {
        :name => 'Haitian Creole',
        :flag => 'ht'},
      'he' => {
        :name => 'Hebrew',
        :flag => 'il'},
      'hi' => {
        :name => 'Hindi',
        :flag => 'in'},
      'mww' => {
        :name => 'Hmong Daw',
        :flag => 'la'},
      'hu' => {
        :name => 'Hungarian',
        :flag => 'hu'},
      'it' => {
        :name => 'Italian',
        :flag => 'it'},
      'ja' => {
        :name => 'Japanese',
        :flag => 'jp'},
      'sw' => {
        :name => 'Kiswahili',
        :flag => 'tz'},
      'tlh' => {
        :name => 'Klingon',
        :flag => 'tk'},
      'tlh-Qaak' => {
        :name => 'Klingon (pIqaD)',
        :flag => 'tk'},
      'ko' => {
        :name => 'Korean',
        :flag => 'kr'},
      'lv' => {
        :name => 'Latvian',
        :flag => 'lv'},
      'lt' => {
        :name => 'Lithuanian',
        :flag => 'lt'},
      'ms' => {
        :name => 'Malay',
        :flag => 'my'},
      'mt' => {
        :name => 'Maltese',
        :flag => 'mt'},
      'no' => {
        :name => 'Norwegian',
        :flag => 'no'},
      'fa' => {
        :name => 'Persian',
        :flag => 'ir'},
      'pl' => {
        :name => 'Polish',
        :flag => 'pl'},
      'pt' => {
        :name => 'Portuguese',
        :flag => 'pt'},
      'otq' => {
        :name => 'Querétaro Otomi',
        :flag => 'mx'},
      'ro' => {
        :name => 'Romanian',
        :flag => 'ro'},
      'ru' => {
        :name => 'Russian',
        :flag => 'ru'},
      'sr-Cyrl' => {
        :name => 'Serbian (Cyrillic)',
        :flag => 'rs'},
      'sr-Latn' => {
        :name => 'Serbian (Latin)',
        :flag => 'rs'},
      'sk' => {
        :name => 'Slovak',
        :flag => 'sk'},
      'sl' => {
        :name => 'Slovenian',
        :flag => 'si'},
      'es' => {
        :name => 'Spanish',
        :flag => 'es'},
      'sv' => {
        :name => 'Swedish',
        :flag => 'se'},
      'th' => {
        :name => 'Thai',
        :flag => 'th'},
      'tr' => {
        :name => 'Turkish',
        :flag => 'tr'},
      'uk' => {
        :name => 'Ukrainian',
        :flag => 'ua'},
      'ur' => {
        :name => 'Urdu',
        :flag => 'pk'},
      'vi' => {
        :name => 'Vietnamese',
        :flag => 'vn'},
      'cy' => {
        :name => 'Welsh',
        :flag => 'gb'},
      'yua' => {
        :name => 'Yucatec Maya',
        :flag => 'mx'}
    }

    if current_user
      session_lang = session['user_language']['session_language']
      @current_lang = {
        'code' => session_lang,
        'name' => @lang_hash[session_lang][:name],
        'flag' => @lang_hash[session_lang][:flag]
      }
    end

    # Array of languages in the format [['French', 'fr'], ...] -- for dropdown menus
    @lang_dropdown_array = []
    @lang_hash.each do |code, value_hash|
      @lang_dropdown_array.push([value_hash[:name], code])
    end
  end

  def language_storage
  end

  def disable_navbar
    @disable_navbar = true
  end
end
