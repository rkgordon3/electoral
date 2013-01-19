class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbrev
      t.integer :electoral_votes
      t.integer :population

      t.timestamps
    end
  end
end
