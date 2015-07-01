class Bookmark < ActiveRecord::Base
  include Commentable

  belongs_to :user
  has_many :favorites
end
