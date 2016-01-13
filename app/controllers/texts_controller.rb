require 'rest-client'
require 'nokogiri'

class TextsController < ApplicationController
  before_action :is_authenticated?
  def index
    @link = Text.all
  end

  def show
    #text from a form is sent link available from a view which is taken from a model
    # @text = params[:text][:text]
    # url = @text
    # response = RestClient.get url
    # html = response.body
    # data = Nokogiri::HTML(html, nil, 'UTF-8')

    # @show = data.css('body')
  end

  def update
  end

  def detroy
  end

  def create
  end

  def new
  end
end
