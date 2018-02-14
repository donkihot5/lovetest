Rails.application.routes.draw do

  

  devise_for :users, :path_prefix => 'd'
  #defining the root url for the website
  root 'pages#index'

  get 'pages/show'

  get 'pages/new'

  get 'pages/create'

  get 'pages/edit'

  get 'pages/update'

  get 'pages/destroy'

  get '/user/:id' => 'users#index'

  get '/user/:id' => 'adminsongs#index'

  get '/user/:id' => 'songs#show'

  #get '/stories' => 'stories#index'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

resources :users

#adding like option routes for songs
resources :songs do
  member do
    post 'like'
  end
end

#adding routes for comments to the songs
resources :songs do
  resources :comments
end
#adding routes for comments to comments
resources :comments do
  resources :comments
end

#resources :pages

resources :stories

#adding like option routes to the images
resources :galleries do
  member do
    post 'imagelike'
  end
end

resources :galleries do
  resources :imagecomments
end

resources :imagecomments do
  resources :imagecomments
end

resources :posts

resources :admins

resources :adminsongs

resources :adminstories

resources :adminimages

resources :aboutpages

resources :helppages

resources :termspages

resources :adspages

resources :statuspages

resources :cookiepages

resources :infopages

resources :gaboutpages

resources :ghelppages




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
