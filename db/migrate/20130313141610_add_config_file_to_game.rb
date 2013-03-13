class AddConfigFileToGame < ActiveRecord::Migration
  def change
    add_column :games, :config_file, :string
  end
end
