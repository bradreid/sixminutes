class AddTaskIdToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :task_id, :integer
  end

  def self.down
    remove_column :events, :task_id
  end
end
