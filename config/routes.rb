# frozen_string_literal: true
Rails.application.routes.draw do

  resources :projects do
    resources :comments
  end
  
  resources :users do
  	resources :comments
  end

  resources :ratings, only: :update

  resources :sessions, only: [:new, :create, :destroy]
  get 'log_out' => 'sessions#destroy', :as => 'log_out'
  root to:'projects#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
