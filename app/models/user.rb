class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  attr_accessor :current_password

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  
  has_many :plans, dependent: :destroy
  has_many :plan_items, dependent: :destroy
  has_one :participants, dependent: :destroy

  def self.gest_user_find_or_create
    user = User.find_or_create_by!(name: 'gest_user',email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
