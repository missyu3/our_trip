class AddColumnSpot < ActiveRecord::Migration[5.2]
  def change
    add_column :plan_items, :address, :string
    add_column :plan_items, :latitude, :float
    add_column :plan_items, :longitude, :float
  end
end
