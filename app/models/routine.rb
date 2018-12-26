class Routine < ActiveRecord::Base
  belongs_to :user
#  acts_as_taggable
#  acts_as_taggable_on :tags

  DAYS = %w(SU MO TU WE TH FR SA)

  def total_commitment
    self.minutes*self.days*self.weeks
  end

  def total_commitment_string
    s = "#{(self.total_commitment/60).to_int} Hours" 
    if self.total_commitment%60 != 0
      s += " #{self.total_commitment%60} Minutes"
    end
    s
  end

end

