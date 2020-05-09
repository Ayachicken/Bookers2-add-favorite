Rails.application.routes.draw do
  devise_for :users
  get '/home/top' => 'home#top'
  get '/home/about' => 'home#about'
  get "/searches/search" => "searches#search", as: 'search' #検索する
  post 'follow/:id' => 'relationships#follow', as:'follow' #フォローする
  get 'users/:id/following' => 'relationships#following',as:'following'
  get 'users/:id/follower' => 'relationships#follower',as: 'follower'
  post 'unfollow/:id' => 'relationships#unfollow', as:'unfollow' #フォローを外す
  root 'home#top'

  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships,only: [:create,:destroy]
  end

  resources :books do
    resources :book_comments,only: [:create,:destroy]
    resource :favorites,only: [:create,:destroy]
  end

end