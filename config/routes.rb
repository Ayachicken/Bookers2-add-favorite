Rails.application.routes.draw do
  devise_for :users
  get '/home/top' => 'home#top'
  get '/home/about' => 'home#about'
  root 'home#top'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resource :book_comments,only: [:create,:destroy]
  end
end
