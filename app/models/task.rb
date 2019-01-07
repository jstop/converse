class Task < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  attr_accessor :due_date

  DURATIONS = {"small" => 30,  "medium" => 60, "large" => 120 }

  def status_class
    if self.deadline_passed or self.completed
      "panel-danger"
    else
      "panel-primary"
    end
  end
  def deadline_passed
    return false if self.deadline.nil? 
    return DateTime.now > self.deadline
  end
end
