@schedule_zones = ScheduleZone.all
@schedule_zones.each do |schedule_zone|
  schedule_zone.destroy
end
