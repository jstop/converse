zone_date_format = '%Y-%m-%dT%H:%M:%S'

events = schedule_zone.events(params[:start], params[:end])

json.array! events do |event|
  json.id "schedule_zone_#{schedule_zone.id}"
  json.start event.start_time.change({hour: schedule_zone.start_hour, min: schedule_zone.start_minute}).strftime(zone_date_format)
  json.end event.end_time.change({hour: schedule_zone.end_hour, min: schedule_zone.end_minute}).strftime(zone_date_format)

  json.color schedule_zone.color unless schedule_zone.color.blank?
  json.allDay false
  json.rendering "background"
end

