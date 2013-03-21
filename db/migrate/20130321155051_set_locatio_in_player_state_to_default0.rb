class SetLocatioInPlayerStateToDefault0 < ActiveRecord::Migration
  def up
   change_column :player_states, :location, :integer, :default => 0
  end

  def down
  end
end
