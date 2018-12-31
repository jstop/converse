class Task < ApplicationRecord
  belongs_to :user
  attr_accessor :date_time
  def status_class
    if self.deadline_passed
      "panel-danger"
    else
      "panel-warning"
    end
  end
  def deadline_passed
    f = DateTime.now > self.deadline
    puts f
    f
  end
end
