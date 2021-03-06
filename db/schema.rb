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

ActiveRecord::Schema.define(version: 20161201074008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "key"
    t.string "provider"
    t.text "parameters"
    t.string "recipient_type"
    t.bigint "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree
  end

  create_table "authentications", id: :serial, force: :cascade do |t|
    t.string "provider", default: "", null: false
    t.string "encrypted_email", default: "", null: false
    t.string "encrypted_email_iv", default: "", null: false
    t.string "encrypted_token", default: "", null: false
    t.string "encrypted_token_iv", default: "", null: false
    t.string "encrypted_username", default: "", null: false
    t.string "encrypted_username_iv", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "encrypted_password_iv", default: "", null: false
    t.string "encrypted_site_id", default: "", null: false
    t.string "encrypted_site_id_iv", default: "", null: false
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_authentications_on_organization_id", using: :btree
    t.index ["provider"], name: "index_authentications_on_provider", using: :btree
  end

  create_table "documents", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.string "source", default: "", null: false
    t.string "source_id", default: "", null: false
    t.string "source_slug", default: "", null: false
    t.string "source_link", default: "", null: false
    t.datetime "source_created_at"
    t.datetime "source_updated_at"
    t.string "kind", default: "", null: false
    t.string "mime_type", default: "", null: false
    t.string "title", default: "", null: false
    t.string "author_id", default: "", null: false
    t.string "author", default: "", null: false
    t.string "dateline", default: "", null: false
    t.string "subtitle", default: "", null: false
    t.text "body_html", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_documents_on_slug", unique: true, using: :btree
  end

  create_table "identities", id: :serial, force: :cascade do |t|
    t.string "uid", default: "", null: false
    t.string "provider", default: "", null: false
    t.string "encrypted_token", default: "", null: false
    t.string "encrypted_token_iv", default: "", null: false
    t.string "encrypted_refresh_token", default: "", null: false
    t.string "encrypted_refresh_token_iv", default: "", null: false
    t.string "expires_at", default: "", null: false
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "image_url", default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider"], name: "index_identities_on_provider", using: :btree
    t.index ["uid"], name: "index_identities_on_uid", using: :btree
    t.index ["user_id"], name: "index_identities_on_user_id", using: :btree
  end

  create_table "organizations", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.string "slug", null: false
    t.string "image_url", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["organization_id"], name: "index_users_on_organization_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  end

  add_foreign_key "users", "organizations"
end
