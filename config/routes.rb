Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'posts#index', as: 'home'

get 'about' => 'pages#about', as: 'about'

get '/logout' => 'users#logout', as: 'logout'
get '/login' => 'users#login', as: 'login'
get '/register' => 'users#register', as: 'register'
get '/sessions' => 'sessions#destroy', as: 'destroy'
post '/sessions' => 'sessions#create', as: 'sessions'
post '/create' => 'users#create'

resources :posts do
	resources :comments
end
end
