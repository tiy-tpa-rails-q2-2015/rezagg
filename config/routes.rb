Rails.application.routes.draw do
  resources :bookmarks do
    delete 'favorite', :on => :member, :action => 'unfavorite'
    put    'favorite', :on => :member
  end
  resource :session, :only => [:create, :destroy]

  root 'bookmarks#index'
end
