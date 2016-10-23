Rails.application.routes.draw do
  root 'home#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'users' => 'users#index'

  post 'friendships' => 'friendships#create'
  delete 'friendships/:id' => 'friendships#destroy'

  get 'messages/sent' => 'messages#sent'
  resources :messages

end
