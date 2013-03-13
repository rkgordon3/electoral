class ChangeTypeToTypeOfInPlayerState < ActiveRecord::Migration
  def up
   add_column :player_states, :type_of, :string
   remove_column :player_states, :type
  end

  def down
  end
end
