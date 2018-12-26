class CreateScheduleZones < ActiveRecord::Migration[5.0]
  def change
    create_table :schedule_zones do |t|
      t.jsonb :payload

      t.timestamps
    end
  end
end
