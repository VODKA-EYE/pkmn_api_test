# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'pokemon', to: 'pokemon#all'
  get 'pokemon/:id', to: 'pokemon#show'
  post 'pokemon/:id/like', to: 'pokemon#like'
  delete 'pokemon/:id/like', to: 'pokemon#remove_like'
  get 'pokemon/:id/rating', to: 'rating#show'

  get 'pokemon_types', to: 'pokemon_type#all'
  get 'pokemon_abilities', to: 'ability#all'
  get 'pokemon_categories', to: 'category#all'
  get 'pokemon_colors', to: 'color#all'
  get 'pokemon_egg_type', to: 'egg_type#all'

  delete 'users/log_out', to: 'users#log_out'
  get 'user', to: 'users#user_info'

  get 'rating', to: 'rating#top'
end
