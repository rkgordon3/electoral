class RemovePartyFromCandidate < ActiveRecord::Migration
  def up
    remove_column :candidates, :party
  end

  def down
  end
end
