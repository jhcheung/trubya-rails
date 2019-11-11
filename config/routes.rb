Rails.application.routes.draw do
  resources :placings
  resources :leaderboards
  resources :images
  resources :question_answers
  resources :answers
  resources :questions
  resources :games
  resources :topics
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
