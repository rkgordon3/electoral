class AddMaxPositionToGame < ActiveRecord::Migration
  def change
    add_column :games, :max_position, :integer
  end
end
