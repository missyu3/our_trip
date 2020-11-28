class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :notify, foreign_key: { to_table: :users }
      t.references :notified, foreign_key: { to_table: :users }
      t.references :event, polymorphic: true
      t.integer :action, defalut: 0
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
