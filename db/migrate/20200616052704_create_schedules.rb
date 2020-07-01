# frozen_string_literal: true

class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :plan, foreign_key: true
      t.integer :sort
      t.references :plan_item, foreign_key: true
      t.datetime :start_datetime
      t.timestamps
    end
  end
end
