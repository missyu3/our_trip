# frozen_string_literal: true

class AddPositionToSchedule < ActiveRecord::Migration[5.2]
  def up
    remove_column :schedules, :sort, :integer
    add_column :schedules, :position, :integer
  end

  def down
    add_column :schedules, :sort, :integer
    remove_column :schedules, :position, :integer
  end
end
