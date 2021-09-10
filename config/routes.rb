Rails.application.routes.draw do
  get 'user/new'
  resources :tweets
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/entry',   to: 'users#new'
  post   '/users/new',   to: 'users#create'
  root :to => 'tweets#index'
end
