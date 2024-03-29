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

ActiveRecord::Schema.define(:version => 20130405212056) do

  create_table "rentalposts", :force => true do |t|
    t.string   "rentaltype"
    t.integer  "user_id"
    t.string   "rental_desc"
    t.integer  "price"
    t.string   "status"
    t.string   "addrl1"
    t.string   "addrl2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "contactpref"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "rentalposts", ["user_id", "created_at"], :name => "index_rentalposts_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "mi_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "phone1"
    t.integer  "phone2"
    t.integer  "phone3"
    t.string   "addr1"
    t.string   "addr2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "uri"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
