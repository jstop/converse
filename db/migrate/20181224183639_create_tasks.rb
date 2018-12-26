class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :duration
      t.string :description
      t.string :content
      t.datetime :deadline
      t.belongs_to :user, index:true

      t.timestamps
    end
  end
end
