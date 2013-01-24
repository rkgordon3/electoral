class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.timestamp :date
      t.string :name
      t.integer :location_id

      t.timestamps
    end
  end
end
