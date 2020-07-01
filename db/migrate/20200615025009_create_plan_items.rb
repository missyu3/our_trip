# frozen_string_literal: true

class CreatePlanItems < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_items do |t|
      t.references :plan, foreign_key: true
      t.string :title
      t.integer :category, defalut: 0
      t.text :content
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
