require 'rest-client'
require 'nokogiri'

class TextsController < ApplicationController
  def index
  end

  def show
    url = "https://www.gutenberg.org/files/21989/21989-0.txt"
    response = RestClient.get url
    html = response.body
    data = Nokogiri::HTML(html, nil, 'UTF-8')

    @show = data.css('body')
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
