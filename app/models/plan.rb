class Plan < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true

  scope :updated_before, -> { order(updated_at: :desc) }

end
