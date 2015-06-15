class User < ActiveRecord::Base
  has_many :bookmarks
  has_many :favorites
  has_many :favorite_bookmarks, :through => :favorites, :source => :bookmark

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def display_name
    name.blank? ? email : name
  end
end
