class AddOutcomeIdToDemographic < ActiveRecord::Migration
  def change
    add_column :demographics, :outcome_id, :integer
  end
end
