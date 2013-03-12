class AddElectionIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :election_id, :integer
  end
end
