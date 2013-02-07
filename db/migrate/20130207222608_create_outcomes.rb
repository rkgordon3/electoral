class CreateOutcomes < ActiveRecord::Migration
  def change
    create_table :outcomes do |t|
      t.integer :event_id
      t.integer :candidate_id
      t.integer :delta

      t.timestamps
    end
  end
end
