class AddCurrentTurnToGame < ActiveRecord::Migration
  def change
    add_column :games, :current_turn, :integer, :default=>0
  end
end
