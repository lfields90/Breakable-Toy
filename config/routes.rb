Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :states do
    resources :cities
  end

  resources :cities do
    resources :neighborhoods
  end

  resources :neighborhoods do
    resources :businesses, only: [:index, :destroy, :show, :update, :edit]
  end

  resources :businesses, only: [:index, :destroy, :show, :update, :edit] do
    resources :reviews
  end

  resources :neighborhoods do
      resources :events, only: [:index, :destroy, :show, :update, :edit]
  end

  resources :events, only: [:index, :destroy, :show, :update, :edit] do
      resources :reviews, only: [:index, :destroy, :show, :update, :edit]
  end

  resources :users, only: [:index, :destroy, :show, :update, :edit]
  resources :votes, only: [:create, :destroy]

  get '/auth/:twitter/callback', to: 'sessions#create'
  get '/auth/:facebook/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
