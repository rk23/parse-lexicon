Rails.application.routes.draw do

  # Main routes
  root 'main#index'
  get '/about'            => 'main#about'
  get '/recommended'      => 'texts#index'

  # Sessions
  get '/login'            => 'sessions#new'
  post '/login'           => 'sessions#create'
  put '/update'          => 'sessions#update'
  get '/logout'           => 'sessions#destroy'

  # Users routes
  get '/signup'           => 'users#new'
  post '/users'           => 'users#create'
  get '/user/:id'         => 'users#show'

  # Parse routes
  post '/parse'           => 'parse#index'
  post '/parse/addwords'  => 'parse#create'
  post '/parse/translate' => 'parse#translate'

  # Texts routes
  post 'texts/create'
  get '/juicyJ'           => 'texts#new'
  # get 'texts/show'
  # get 'texts/update'
  # get 'texts/detroy'

  # Lexicon routes
  get '/lexicon'          => 'lexicon#index'
  get '/lexicon/:lang'    => 'lexicon#index'
  delete '/lexicon'          => 'lexicon#delete'

  #404 route
  get "*any", via: :all, to: "errors#not_found"

  #Favorite routes
  # get '/users/:id/favorites'         => 'favorites#index'
  # get '/users/:id/favorites/:id'     => 'favorites#show'
  # get '/users/:id/favorites/new'     => 'favorites#new'
  # post '/users/:id/favorites/new'    => 'favorites#create'
  # delete '/users/:id/favorites/:id'  => 'favorites#destroy'

  # get 'favorites/update'
  # get 'favorites/edit'

end
