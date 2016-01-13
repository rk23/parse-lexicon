class MainController < ApplicationController
	before_action :is_authenticated?
	before_filter :disable_nav, only: [:index]
  
  def index
  end

  def about

  end

  def recommended

  end
end
