class AddTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks, :force => true do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :name
      t.string :status, :default => 'new'
      t.timestamps
    end
    add_index :tasks, :user_id
    add_index :tasks, :project_id
    
    
  end

  def self.down
    remove_index :tasks, :project_id
    remove_index :tasks, :user_id
    drop_table :tasks
  end
end