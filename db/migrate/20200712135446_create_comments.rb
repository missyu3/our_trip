class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :plan_item
      t.references :user
      t.text :content
      t.timestamps
    end
  end
end