# frozen_string_literal: true

class AddPrimaryNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :name, unique: true
  end
end
