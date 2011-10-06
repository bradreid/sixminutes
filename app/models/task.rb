class Task < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :project

  validates_presence_of :name
  validates_numericality_of :time_estimate, :allow_nil => true
end