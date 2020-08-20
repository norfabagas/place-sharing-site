Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, :controllers => { :registrations => "registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/:username', to: 'pages#profile', as: 'profile_page'
end
