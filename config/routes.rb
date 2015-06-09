Rails.application.routes.draw do
  resources :bookmarks
  resource :session, :only => [:create, :destroy]

  root 'bookmarks#index'
end
