# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  start      :datetime
#  end        :datetime
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  attr_accessor :date_range

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end
  def duration
    ((self.end - self.start)/60).to_i
  end
end
