DeathStarPhotoService::Application.routes.draw do
  resources :users

  get 'welcome/home'
  resources :photos
  root 'welcome#home'
end
