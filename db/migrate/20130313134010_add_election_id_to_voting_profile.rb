class AddElectionIdToVotingProfile < ActiveRecord::Migration
  def change
    add_column :voting_profiles, :election_id, :integer
  end
end
