Rails.application.routes.draw do
  resources :posts
  devise_for :users, :controllers => {
    :registrations => "registrations"
  }

  resources :bookmarks do
    delete 'favorite', :on => :member, :action => 'unfavorite'
    put    'favorite', :on => :member
  end

  resources :comments, :only => [:create, :destroy]

  root 'bookmarks#index'
end
