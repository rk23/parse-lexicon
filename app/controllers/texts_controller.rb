require 'rest-client'
require 'nokogiri'

class TextsController < ApplicationController
  def index
  end

  def show
    url = "https://www.gutenberg.org/files/30655/30655-h/30655-h.htm"
    response = RestClient.get url
    html = response.body
    data = Nokogiri::HTML(html.encode('UTF-8'), nil, 'UTF-8')
    # data.encoding = 'iso-8859-1'

    @show = data.css('body')
    render text: @show
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
