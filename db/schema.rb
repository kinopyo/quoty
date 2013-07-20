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

ActiveRecord::Schema.define(version: 20130720022052) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "authors", force: true do |t|
    t.string   "name"
    t.text     "profile"
    t.integer  "quotes_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "authors", ["slug"], name: "index_authors_on_slug", unique: true

  create_table "bookmarks", force: true do |t|
    t.integer  "user_id"
    t.integer  "quote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bookmarks", ["quote_id"], name: "index_bookmarks_on_quote_id"
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id"

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "quote_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "properties"
  end

  add_index "comments", ["quote_id"], name: "index_comments_on_quote_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "identities", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "oauth_access_grants", force: true do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.string   "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true

  create_table "oauth_access_tokens", force: true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true

  create_table "oauth_applications", force: true do |t|
    t.string   "name",         null: false
    t.string   "uid",          null: false
    t.string   "secret",       null: false
    t.string   "redirect_uri", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true

  create_table "photos", force: true do |t|
    t.string   "file"
    t.integer  "quote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "providers", ["user_id"], name: "index_identities_on_user_id"

  create_table "quotes", force: true do |t|
    t.text     "content"
    t.string   "source"
    t.string   "language"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.integer  "score",          default: 0
    t.integer  "comments_count", default: 0
    t.text     "context"
    t.integer  "source_wiki_id"
    t.integer  "author_wiki_id"
    t.integer  "author_id"
  end

  add_index "quotes", ["author_id"], name: "index_quotes_on_author_id"
  add_index "quotes", ["source_wiki_id"], name: "index_quotes_on_source_wiki_id"
  add_index "quotes", ["user_id"], name: "index_quotes_on_user_id"

  create_table "user_preferences", force: true do |t|
    t.integer  "user_id"
    t.string   "locale"
    t.string   "languages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_preferences", ["user_id"], name: "index_user_preferences_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "slug"
    t.string   "email"
    t.text     "profile"
    t.string   "email_md5"
    t.datetime "omniauth_info_updated_at"
    t.boolean  "is_admin",                 default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
  end

  add_index "users", ["slug"], name: "index_users_on_slug", unique: true

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "quote_id"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wikis", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "ancestry"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "wikis", ["ancestry"], name: "index_wikis_on_ancestry"

end
