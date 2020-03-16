Rails.application.routes.draw do
  get 'users/new'
  get 'posts/show'
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root   'posts#show'
  get    '/login',   to: 'sessions#new'
  post '/login' => 'sessions#create'
  get    '/signup',   to: 'users#new'
  post '/signup' => 'users#create'
  get '/logout',  to: 'sessions#destroy'
end
