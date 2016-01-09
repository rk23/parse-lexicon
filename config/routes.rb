Rails.application.routes.draw do

  root 'main#index'

  get '/translate' => 'translate#index'

  #Favorite routes

  # get 'favorites/index'
  #
  # get 'favorites/new'
  #
  # get 'favorites/create'
  #
  # get 'favorites/update'
  #
  # get 'favorites/edit'
  #
  # get 'favorites/destroy'
  #
  # get 'favorites/show'
  #
  # get 'translate/index'

end
