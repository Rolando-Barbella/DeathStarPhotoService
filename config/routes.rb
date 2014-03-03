DeathStarPhotoService::Application.routes.draw do
  devise_for :users
  resources :users

  get 'welcome/home'
  resources :photos
  root 'welcome#home'
end
