class AddTriggerCandidateToEvent < ActiveRecord::Migration
  def change
    add_column :events, :candidate_id, :integer
  end
end
