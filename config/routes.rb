Rails.application.routes.draw do
  devise_for :users

  resources :bookmarks do
    delete 'favorite', :on => :member, :action => 'unfavorite'
    put    'favorite', :on => :member
  end

  root 'bookmarks#index'
end
