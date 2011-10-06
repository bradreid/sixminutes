class AddTimeEstimateToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :time_estimate, :integer
  end

  def self.down
    remove_column :tasks, :time_estimate
  end
end
