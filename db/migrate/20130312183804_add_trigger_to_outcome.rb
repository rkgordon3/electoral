class AddTriggerToOutcome < ActiveRecord::Migration
  def change
    add_column :outcomes, :trigger, :string
  end
end
