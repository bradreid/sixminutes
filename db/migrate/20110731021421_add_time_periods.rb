class AddTimePeriods < ActiveRecord::Migration
  def self.up
    create_table :events, :force => true do |t|
      t.string :name
      t.datetime :end_at
      t.string :state
      t.integer :length
      t.timestamps
    end
    add_index :events, :created_at
    add_index :events, :end_at
    add_index :events, :state
  end

  def self.down
    remove_index :events, :state
    remove_index :events, :end_at
    remove_index :events, :created_at
    drop_table :events
  end
end