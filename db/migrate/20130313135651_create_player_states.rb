class CreatePlayerStates < ActiveRecord::Migration
  def change
    create_table :player_states do |t|
      t.integer :game_id
      t.integer :player_id
      t.string :type
      t.integer :location

      t.timestamps
    end
  end
end
