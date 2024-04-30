Rails.application.routes.draw do
  get 'users/index'
  get 'static_pages/home'
  root 'static_pages#home'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/:nickname', to: 'users#show'
  get '/:nickname/followers', to:'users#show_followers'
  get '/:nickname/followings', to:'users#show_followings'
  post '/tweets/reply'
  resources :tweets, only:[:create,:destroy,:show]
  resources :follow_relationships, only:[:create,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
