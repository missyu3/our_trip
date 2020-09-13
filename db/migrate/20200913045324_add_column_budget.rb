class AddColumnBudget < ActiveRecord::Migration[5.2]
  def change
    add_column :plan_items, :budget, :integer
  end
end
