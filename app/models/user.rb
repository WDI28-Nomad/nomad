class User < ActiveRecord::Base

  has_many :trips

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :username, :avatar, :current_city
  # validates :username,
  #           presence: true,
  #           uniqueness: true
  # validates :first_name, :last_name,
  #           presence: true,
  #           length: { maximum: 255 }


  mount_uploader :avatar, PictureUploader
end
