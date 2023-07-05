# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions', passwords: 'passwords' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'pokemon', to: 'pokemon#all'
  get 'pokemon/:id', to: 'pokemon#show'
  post 'pokemon/:id/like', to: 'pokemon#like'
  delete 'pokemon/:id/like', to: 'pokemon#remove_like'
  get 'pokemon/:id/rating', to: 'rating#show'

  delete 'users/log_out', to: 'users#log_out'
  get 'users', to: 'users#user_info'

  get 'rating', to: 'rating#top'

  get 'random', to: 'pokemon#random'

  get 'quiz/question', to: 'quiz_question#get_question'
  post 'quiz/result', to: 'quiz_question#result'

  resources :pokemon, controller: :pokemon, only: %i[create update destroy]
end
