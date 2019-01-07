class TimeLog < ApplicationRecord
  belongs_to :task, optional: true
  belongs_to :user
end

