class AddCompletionToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :completed, :boolean
    add_column :tasks, :completed_time, :datetime
  end
end
