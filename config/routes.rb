Rails.application.routes.draw do
  get 'home/about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  resources :books, only: [:index, :show,:update,:destroy ,:create ,:edit]
  resources :users, only: [:show, :index ,:edit ,:update]
  
   get "/home/about" => "home#about", as: "about"
end
