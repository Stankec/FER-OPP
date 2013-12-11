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

ActiveRecord::Schema.define(version: 20131021172108) do

  create_table "categories", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "icon"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "clients", force: true do |t|
    t.string   "nameFirst"
    t.string   "nameLast"
    t.string   "contactAdress"
    t.string   "contactTelephone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients_vehicles", force: true do |t|
    t.integer "client_id"
    t.integer "vehicle_id"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "images", force: true do |t|
    t.string   "imageName"
    t.integer  "imageType"
    t.string   "path"
    t.boolean  "isHidden"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "networks", force: true do |t|
    t.string   "name"
    t.string   "icon"
    t.string   "link"
    t.boolean  "hidden"
    t.boolean  "showName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_parts", force: true do |t|
    t.integer  "order_id"
    t.integer  "part_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_parts", ["order_id"], name: "index_order_parts_on_order_id"
  add_index "order_parts", ["part_id"], name: "index_order_parts_on_part_id"

  create_table "orders", force: true do |t|
    t.integer  "client_id"
    t.integer  "vehicle_id"
    t.integer  "user_id"
    t.text     "description"
    t.integer  "status"
    t.datetime "timeStart"
    t.datetime "timeFinish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["client_id"], name: "index_orders_on_client_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"
  add_index "orders", ["vehicle_id"], name: "index_orders_on_vehicle_id"

  create_table "orders_procedures", force: true do |t|
    t.integer "order_id"
    t.integer "procedure_id"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "ancestry"
    t.string   "icon"
    t.text     "content"
    t.text     "contentPreview"
    t.boolean  "isPublic"
    t.boolean  "isHidden"
    t.boolean  "hasPreview"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["category_id"], name: "index_pages_on_category_id"

  create_table "part_procedures", force: true do |t|
    t.integer  "part_id"
    t.integer  "procedure_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "part_procedures", ["part_id"], name: "index_part_procedures_on_part_id"
  add_index "part_procedures", ["procedure_id"], name: "index_part_procedures_on_procedure_id"

  create_table "parts", force: true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "procedures", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "minNumOfWorkers"
    t.float    "duration"
    t.float    "manHour"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.boolean  "canViewUsers"
    t.boolean  "canViewRoles"
    t.boolean  "canViewOrders"
    t.boolean  "canViewClients"
    t.boolean  "canViewVehicles"
    t.boolean  "canViewProcedures"
    t.boolean  "canViewSettings"
    t.boolean  "canViewParts"
    t.boolean  "canViewworkingHours"
    t.boolean  "canViewStatements"
    t.boolean  "canChangeUsers"
    t.boolean  "canChangeRoles"
    t.boolean  "canChangeOrders"
    t.boolean  "canChangeClients"
    t.boolean  "canChangeVehicles"
    t.boolean  "canChangeProcedures"
    t.boolean  "canChangeSettings"
    t.boolean  "canChangeParts"
    t.boolean  "canChangeworkingHours"
    t.boolean  "canChangeStatements"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "settings", force: true do |t|
    t.string   "pageTitle"
    t.text     "pageDescription"
    t.integer  "pageFavicon_id"
    t.integer  "pagePreview_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statements", force: true do |t|
    t.integer  "type"
    t.date     "statementDate"
    t.float    "money"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "nameFirst"
    t.string   "nameLast"
    t.string   "loginUsername"
    t.string   "loginPasswordHash"
    t.string   "loginPasswordSalt"
    t.string   "loginAuthToken"
    t.datetime "loginLast"
    t.string   "contactEmail"
    t.string   "contactPhone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", force: true do |t|
    t.string   "vehicleModel"
    t.integer  "buildYear"
    t.string   "vehicleRegistration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "working_hours", force: true do |t|
    t.integer  "day"
    t.time     "timeStart"
    t.time     "timeFinish"
    t.boolean  "exception"
    t.date     "exceptiondate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
