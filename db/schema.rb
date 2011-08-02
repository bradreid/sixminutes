# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110731021421) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "end_at"
    t.string   "state"
    t.integer  "length"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["created_at"], :name => "index_events_on_created_at"
  add_index "events", ["end_at"], :name => "index_events_on_end_at"
  add_index "events", ["state"], :name => "index_events_on_state"

end
