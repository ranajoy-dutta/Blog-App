Rails.application.routes.draw do
	
  devise_for :users
  
  resources :articles do
  	resources :comments
  end

  get '/posts' => 'articles#home'
  root 'articles#index'
  get '/signup' => 'devise/registrations#new'
end
