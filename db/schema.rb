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

ActiveRecord::Schema.define(version: 20130902202610) do

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
    t.integer  "rank2"
    t.integer  "rank3"
    t.integer  "pos_rank"
    t.boolean  "taken"
    t.integer  "draft_id"
    t.integer  "team_id"
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
