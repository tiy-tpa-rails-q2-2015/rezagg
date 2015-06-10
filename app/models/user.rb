class User < ActiveRecord::Base
  has_secure_password
  has_many :bookmarks
  has_many :favorites
  has_many :favorite_bookmarks, :through => :favorites, :source => :bookmark
end
