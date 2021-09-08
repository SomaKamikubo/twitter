Rails.application.routes.draw do
  get 'user/new'
  resources :tweets
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/entry',   to: 'user#new'
  post   '/user/new',   to: 'user#create'
  root :to => 'tweets#index'
end
