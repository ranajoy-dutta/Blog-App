Rails.application.routes.draw do
	
  devise_for :users
  resources :articles do
  	resources :comments
  end
  get '/posts' => 'articles#home'
  root 'articles#index'
  get :signup, :path => '/user/sign_up'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
