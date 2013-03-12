class ChangeValueToValueIdInDemographic < ActiveRecord::Migration
  def up
   remove_column :demographics, :value
   add_column    :demographics, :value_id, :integer
  end

  def down
  end
end
