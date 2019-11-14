Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy' 
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/home', to: 'welcome#home'


  get '/admin/login', to: 'sessions#admin_new'
  post '/admin/login', to: 'sessions#admin_create'
  get '/admin/home', to: 'welcome#admin_home'
  get '/admin/signup', to: 'users#admin_new'
  post '/admin/signup', to: 'users#admin_create'
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
  resources :users, except: [:new]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
