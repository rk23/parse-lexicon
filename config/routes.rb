Rails.application.routes.draw do

  #Main routes
  root 'main#index'
  get '/recommended'  => 'main#recommended'

  #Users routes
  get '/signup'       => 'users#new'
  post '/users'       => 'users#create'
  get '/user/:id'     => 'users#show'

  #Translate routes
  get '/translate'    => 'translate#index'

  #Favorite routes
  get '/user/:id/favorites'         => 'favorites#index'
  get '/user/:id/favorites/:id'     => 'favorites#show'
  get '/user/:id/favorites/new'     => 'favorites#new'
  post '/user/:id/favorites/new'    => 'favorites#create'
  delete '/user/:id/favorites/:id'  => 'favorites#destroy'

  # get 'favorites/update'
  # get 'favorites/edit'

end
