class CreateVotingProfiles < ActiveRecord::Migration
  def change
    create_table :voting_profiles do |t|
      t.integer :state_id
      t.integer :candidate_id
      t.integer :votes

      t.timestamps
    end
  end
end
