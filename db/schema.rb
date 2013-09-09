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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130909174828) do

  create_table "clubs", force: true do |t|
    t.string   "city_abr"
    t.string   "city"
    t.string   "name"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "ties"
    t.decimal  "win_percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drafts", force: true do |t|
    t.integer  "round"
    t.integer  "pick"
    t.integer  "overall_pick"
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "position"
    t.integer  "rank1"
    t.decimal  "rank2"
    t.integer  "rank3"
    t.string   "value"
    t.boolean  "taken"
    t.integer  "draft_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pos_rank"
    t.decimal  "wkly_points"
  end

  create_table "schedules", force: true do |t|
    t.integer  "week"
    t.datetime "date"
    t.integer  "visitor_id"
    t.integer  "home_id"
    t.integer  "visitor_score"
    t.integer  "home_score"
    t.integer  "winning_team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "owner"
    t.integer  "draft_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
