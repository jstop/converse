class CreateTimeLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :time_logs do |t|
      t.datetime :datetime
      t.string :log
      t.integer :duration
      t.belongs_to :user, index: true
      t.belongs_to :task, index: true
    end
  end
end
