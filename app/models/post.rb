class Post < ActiveRecord::Base
  include Commentable
  belongs_to :user
end
