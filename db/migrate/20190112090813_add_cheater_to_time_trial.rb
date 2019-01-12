class AddCheaterToTimeTrial < ActiveRecord::Migration[5.0]
  def change
    add_column :time_trials, :cheater, :boolean
  end
end
