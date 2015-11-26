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

ActiveRecord::Schema.define(version: 20150624164848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "paddock_id"
    t.integer  "provider_id"
    t.date     "fecha_compra"
    t.date     "fecha_venta"
    t.boolean  "genero"
    t.boolean  "cria"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "animals", ["paddock_id"], name: "index_animals_on_paddock_id", using: :btree
  add_index "animals", ["provider_id"], name: "index_animals_on_provider_id", using: :btree
  add_index "animals", ["usuario_id"], name: "index_animals_on_usuario_id", using: :btree

  create_table "buys", force: :cascade do |t|
    t.date     "fecha_compra"
    t.float    "peso_compra"
    t.float    "monto"
    t.boolean  "estado"
    t.integer  "unidad"
    t.integer  "id_proveedor"
    t.integer  "id_compra"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
  end

  add_index "buys", ["usuario_id"], name: "index_buys_on_usuario_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "sell_id"
    t.string   "nombre_cliente"
    t.string   "documento_fiscal"
    t.string   "telefono"
    t.text     "direccion"
    t.string   "email"
    t.boolean  "estado"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "customers", ["sell_id"], name: "index_customers_on_sell_id", using: :btree
  add_index "customers", ["usuario_id"], name: "index_customers_on_usuario_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "sell_id"
    t.integer  "customer_id"
    t.date     "fecha_factura"
    t.float    "monto"
    t.boolean  "estado"
    t.integer  "cantidad"
    t.string   "nombre"
    t.text     "direccion"
    t.string   "telefono"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "invoices", ["customer_id"], name: "index_invoices_on_customer_id", using: :btree
  add_index "invoices", ["sell_id"], name: "index_invoices_on_sell_id", using: :btree
  add_index "invoices", ["usuario_id"], name: "index_invoices_on_usuario_id", using: :btree

  create_table "paddocks", force: :cascade do |t|
    t.integer  "usuario_id"
    t.string   "nombre_potrero"
    t.text     "info_extra"
    t.integer  "max_cap"
    t.integer  "capacidad_actual"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "paddocks", ["usuario_id"], name: "index_paddocks_on_usuario_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "usuario_id"
    t.string   "nombre"
    t.text     "direccion"
    t.string   "email"
    t.string   "telefono"
    t.float    "bsf_por_kg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["usuario_id"], name: "index_profiles_on_usuario_id", using: :btree

  create_table "providers", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "buy_id"
    t.string   "nombre"
    t.string   "documento_fiscal"
    t.string   "telefono"
    t.string   "direccion"
    t.string   "email"
    t.boolean  "estado"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "providers", ["buy_id"], name: "index_providers_on_buy_id", using: :btree
  add_index "providers", ["usuario_id"], name: "index_providers_on_usuario_id", using: :btree

  create_table "sells", force: :cascade do |t|
    t.integer  "usuario_id"
    t.date     "fecha_compra"
    t.float    "peso_final"
    t.float    "monto"
    t.boolean  "estado"
    t.integer  "cantidad"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "sells", ["usuario_id"], name: "index_sells_on_usuario_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.date     "fecha_registro"
    t.string   "password"
    t.string   "username"
    t.integer  "id_user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "permission_level"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "authentication_token"
  end

  add_index "usuarios", ["authentication_token"], name: "index_usuarios_on_authentication_token", using: :btree
  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "animals", "paddocks"
  add_foreign_key "animals", "providers"
  add_foreign_key "animals", "usuarios"
  add_foreign_key "buys", "usuarios"
  add_foreign_key "customers", "sells"
  add_foreign_key "customers", "usuarios"
  add_foreign_key "invoices", "customers"
  add_foreign_key "invoices", "sells"
  add_foreign_key "invoices", "usuarios"
  add_foreign_key "paddocks", "usuarios"
  add_foreign_key "profiles", "usuarios"
  add_foreign_key "providers", "buys"
  add_foreign_key "providers", "usuarios"
  add_foreign_key "sells", "usuarios"
end
