class AddPartyIdToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :party_id, :integer
  end
end
