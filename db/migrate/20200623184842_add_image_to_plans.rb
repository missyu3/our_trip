class AddImageToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :image, :string
  end
end
