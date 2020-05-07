Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'posts#index', as: 'home'

get 'about' => 'pages#about', as: 'about'

get '/login' => 'users#login', as: 'login'
get '/register' => 'users#register', as: 'register'
post '/sessions' => 'sessions#create'
post '/create' => 'users#create'

resources :posts do
	resources :comments
end
end
