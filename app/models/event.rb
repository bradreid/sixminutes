class Event < ActiveRecord::Base
  
  before_save :set_end_at
  
  def duration
    self.end_at ? self.end_at - self.created_at : nil
  end
  
private

  def set_end_at
    self.end_at = Time.now if ['finished', 'reset'].include? self.state
  end
end