Rails.application.routes.draw do
  get 'tweets/not_logged_in', to: 'tweets#not_logged_in'
  get 'relationships/create'
  get 'relationships/destroy'
  resources :tweets
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users ,only: [:new, :create, :update, :edit]
  root :to => 'tweets#index'
  post 'tweets/:id', to:'tweets#create'
  # resources :likes ,only: [:destroy] 

  delete 'tweets/:tweet_id/likes', to: 'likes#destroy' 
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end 

  resources :users do
    resources :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    get :search, on: :collection
  end 
  delete 'users/:user_id/relationships', to: 'relationships#destroy' 

  get 'users/:id/followings' => 'users#followings'
  get 'users/:id/followers' => 'users#followers'

  resources :searchs, only: [:index]

  post 'searchs', to: 'searchs#user'
  get 'searchs/user', to:'searchs#user'
 # get

  
end
