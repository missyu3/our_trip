# frozen_string_literal: true

class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :name
      t.text   :content
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
