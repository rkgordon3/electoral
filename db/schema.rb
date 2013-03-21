# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130321180516) do

  create_table "candidates", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "party_id"
    t.string   "image"
    t.integer  "election_id"
    t.date     "campaign_date"
  end

  create_table "demographics", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "value_id"
    t.integer  "outcome_id"
    t.string   "type_of"
  end

  create_table "elections", :force => true do |t|
    t.string   "name"
    t.integer  "game_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "date"
  end

  create_table "events", :force => true do |t|
    t.datetime "date"
    t.string   "name"
    t.integer  "location_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "event_type"
    t.string   "description"
    t.string   "caption"
    t.integer  "candidate_id"
    t.integer  "election_id"
  end

  create_table "game_sessions", :force => true do |t|
    t.integer  "game_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.integer  "election_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "config_file"
    t.date     "start_date"
    t.integer  "candidate_id"
    t.integer  "current_turn", :default => 0
    t.integer  "max_position"
  end

  create_table "outcomes", :force => true do |t|
    t.integer  "event_id"
    t.integer  "candidate_id"
    t.integer  "delta"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "trigger"
  end

  create_table "parties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "player_states", :force => true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "location",   :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "type_of"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "abbrev"
    t.integer  "electoral_votes"
    t.integer  "population"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "voting_profiles", :force => true do |t|
    t.integer  "state_id"
    t.integer  "candidate_id"
    t.integer  "votes"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "election_id"
  end

end
