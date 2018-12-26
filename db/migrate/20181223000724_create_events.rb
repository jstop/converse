class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :color
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
