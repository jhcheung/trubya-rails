Rails.application.routes.draw do
  get '/topics', to: 'topics#index'
  get '/topics/edit_all', to: 'topics#edit_all'
  post '/topics/edit_all', to: 'topics#update_all'
  get '/questions/random', to: 'questions#random'
  post '/questions/random', to: 'questions#random_create'

  resources :placings
  resources :leaderboards
  resources :images
  resources :answers
  resources :questions
  resources :games
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
