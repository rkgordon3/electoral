class AddDateToElection < ActiveRecord::Migration
  def change
    add_column :elections, :date, :date
  end
end
