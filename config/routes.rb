Rails.application.routes.draw do

  #Main routes
  root 'main#index'
  get '/about'        => 'main#about'
  get '/recommended'  => 'main#recommended'

  #Users routes
  get '/signup'       => 'users#new'
  post '/users'       => 'users#create'
  get '/user/:id'     => 'users#show'

  #Translate routes
  get '/translate'    => 'translate#index'

  #Favorite routes
  get '/users/:id/favorites'         => 'favorites#index'
  get '/users/:id/favorites/:id'     => 'favorites#show'
  get '/users/:id/favorites/new'     => 'favorites#new'
  post '/users/:id/favorites/new'    => 'favorites#create'
  delete '/users/:id/favorites/:id'  => 'favorites#destroy'

  # get 'favorites/update'
  # get 'favorites/edit'

end
