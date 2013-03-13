class AddCandidateIdToGame < ActiveRecord::Migration
  def change
    add_column :games, :candidate_id, :integer
  end
end
