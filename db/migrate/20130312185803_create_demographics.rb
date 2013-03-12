class CreateDemographics < ActiveRecord::Migration
  def change
    create_table :demographics do |t|
      t.string :type
      t.string :value

      t.timestamps
    end
  end
end
