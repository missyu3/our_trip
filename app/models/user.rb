class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  attr_accessor :current_password

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  
  has_many :plans, dependent: :destroy
  has_many :plan_items, dependent: :destroy
end
