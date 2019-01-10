class CreateTimeTrials < ActiveRecord::Migration[5.0]
  def change
    create_table :time_trials do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :time

      t.timestamps
    end
  end
end
