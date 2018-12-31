%w( work morning).each do |w| 
  @schedule_zone_payload = JSON.parse(File.read("/myapp/db/seed_data/schedule_zones/#{w}.json"))
  @schedule_zone = ScheduleZone.new
  @schedule_zone.payload = @schedule_zone_payload
  @schedule_zone.save
end
