class AddCampaignDateToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :campaign_date, :date
  end
end
