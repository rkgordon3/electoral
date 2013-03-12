class ChangeTypeToTypeOfInDemographics < ActiveRecord::Migration
  def up
   add_column :demographics, :type_of, :string
   remove_column :demographics, :type
  end

  def down
  end
end
