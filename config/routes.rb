# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'pokemon', to: 'pokemon#all'
  get 'pokemon/:id', to: 'pokemon#show'
  delete 'users/log_out', to: 'users#log_out'
  get 'user', to: 'users#user_info'
end
