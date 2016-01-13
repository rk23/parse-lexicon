Rails.application.routes.draw do

  # Texts routes
  
  # get 'texts/show'
  # get 'texts/update'
  # get 'texts/detroy'
  # get 'texts/create'
  # get 'texts/new'

  # Main routes
  root 'main#index'
  get '/about'        => 'main#about'
  get '/recommended'  => 'texts#index'

  # Sessions
  get '/login'        => 'sessions#new'
  post '/login'       => 'sessions#create'
  get '/logout'       => 'sessions#destroy'

  # Users routes
  get '/signup'       => 'users#new'
  post '/users'       => 'users#create'
  get '/user/:id'     => 'users#show'

  # Parse routes
  # get '/parse'          => 'parse#index'
  post '/parse'           => 'parse#index'
  post '/parse/addwords'  => 'parse#create'

  #Favorite routes
  get '/users/:id/favorites'         => 'favorites#index'
  get '/users/:id/favorites/:id'     => 'favorites#show'
  get '/users/:id/favorites/new'     => 'favorites#new'
  post '/users/:id/favorites/new'    => 'favorites#create'
  delete '/users/:id/favorites/:id'  => 'favorites#destroy'

  # get '/recommended' => 'texts#index'
  # get '/recommended' => 'texts#index'
  get '/texts/show' => 'texts#show'
  post '/texts/show' => 'texts#show'

  # get 'favorites/update'
  # get 'favorites/edit'

end
