DeathStarPhotoService::Application.routes.draw do
  get 'welcome/home'
  resources :photos
  root 'welcome#home'
end
