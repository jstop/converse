class ScheduleZone < ApplicationRecord
  serialize :preferences, JSON

  def created_on
    self.payload["created_on"].to_date
  end

  def color
    self.payload["color"]
  end

  def days
    self.payload["days"]
  end

  def start_hour
    self.payload["start_time"][0..1].to_i
  end
  def start_minute
    self.payload["start_time"][3..5].to_i
  end
  def end_hour
    self.payload["end_time"][0..1].to_i
  end
  def end_minute
    self.payload["end_time"][3..5].to_i
  end

  def schedule
    @schedule ||= begin
      schedule = IceCube::Schedule.new(now = created_on)
      schedule.add_recurrence_rule IceCube::Rule.weekly(1).day(*self.days.map { |x| x.to_sym })
      schedule
    end
  end
  def events(start_date, end_date)
    start_frequency = start_date ? start_date.to_date : Date.today - 1.year
    end_frequency = end_date ? end_date.to_date : Date.today + 1.year
    schedule.occurrences_between(start_frequency, end_frequency)
  end

end
