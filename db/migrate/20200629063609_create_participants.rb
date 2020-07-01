class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.references :plan, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index  :participants, [:plan_id, :user_id], unique: true
  end
end
