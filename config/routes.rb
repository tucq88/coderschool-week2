Rails.application.routes.draw do
  root 'home#index'

  get 'login' => 'sessions#login'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
