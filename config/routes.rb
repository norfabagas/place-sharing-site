Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, :controllers => { :registrations => "registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/profile', to: 'pages#user', as: 'user_page'
  post '/follow_or_unfollow', to: 'pages#follow_or_unfollow', as: 'follow_or_unfollow'
  get '/following', to: 'pages#following', as: 'following'
  get '/find-users', to: 'pages#find_users', as: 'find_users'

  resources :places, except: [:index]

  # place this url below for non-ambiguous routing
  get '/:username', to: 'pages#profile', as: 'profile_page'
end
