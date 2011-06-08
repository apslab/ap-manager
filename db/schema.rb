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

ActiveRecord::Schema.define(:version => 20110606212409) do

  create_table "accounts", :force => true do |t|
    t.string  "name"
    t.string  "code"
    t.boolean "archive"
    t.integer "company_id"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.integer "details_count", :default => 0
  end

  add_index "accounts", ["company_id", "parent_id"], :name => "index_accounts_on_company_id_and_parent_id"
  add_index "accounts", ["company_id"], :name => "index_accounts_on_company_id"
  add_index "accounts", ["lft", "rgt"], :name => "index_accounts_on_lft_and_rgt"

  create_table "clientes", :force => true do |t|
    t.string   "codigo"
    t.string   "razonsocial"
    t.string   "cuit"
    t.string   "telefono"
    t.string   "direccion"
    t.string   "contacto"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "condicioniva_id"
    t.integer  "empresa_id"
    t.integer  "account_id"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exercises_count", :default => 0
    t.integer  "accounts_count",  :default => 0
    t.string   "engines"
  end

  create_table "comprobantes", :force => true do |t|
    t.integer  "cliente_id"
    t.string   "type"
    t.date     "fecha"
    t.decimal  "importe"
    t.integer  "numero"
    t.date     "fechavto"
    t.date     "printed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "condicionivas", :force => true do |t|
    t.string   "detalle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "letra"
    t.integer  "empresa_id"
  end

  create_table "details", :force => true do |t|
    t.integer "entry_id"
    t.string  "description"
    t.integer "account_id"
    t.decimal "debit"
    t.decimal "credit"
  end

  add_index "details", ["account_id"], :name => "index_details_on_account_id"
  add_index "details", ["entry_id"], :name => "index_details_on_entry_id"

  create_table "detalles", :force => true do |t|
    t.integer  "detallable_id"
    t.string   "detallable_type"
    t.string   "descripcion"
    t.decimal  "cantidad"
    t.decimal  "preciounitario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "tasaiva"
  end

  create_table "entries", :force => true do |t|
    t.string  "description"
    t.date    "date_on"
    t.integer "exercise_id"
    t.integer "details_count", :default => 0
  end

  add_index "entries", ["exercise_id"], :name => "index_entries_on_exercise_id"

  create_table "exercises", :force => true do |t|
    t.date    "started_on"
    t.date    "finished_on"
    t.boolean "uneven",        :default => false
    t.boolean "close",         :default => false
    t.integer "company_id"
    t.integer "entries_count", :default => 0
    t.string  "description"
  end

  add_index "exercises", ["close"], :name => "index_exercises_on_close"
  add_index "exercises", ["company_id", "close"], :name => "index_exercises_on_company_id_and_close"
  add_index "exercises", ["company_id", "started_on", "finished_on"], :name => "index_exercises_on_company_id_and_started_on_and_finished_on", :unique => true
  add_index "exercises", ["company_id"], :name => "index_exercises_on_company_id"

  create_table "facturadetalles", :force => true do |t|
    t.integer  "factura_id"
    t.string   "descripcion"
    t.decimal  "cantidad"
    t.decimal  "preciounitario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "tasaiva"
  end

  create_table "facturanotacreditos", :force => true do |t|
    t.integer  "factura_id"
    t.date     "fecha"
    t.decimal  "importe"
    t.integer  "notacredito_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facturarecibos", :force => true do |t|
    t.integer  "factura_id"
    t.date     "fecha"
    t.decimal  "importe"
    t.integer  "recibo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facturas", :force => true do |t|
    t.integer  "cliente_id"
    t.date     "fecha"
    t.integer  "numero"
    t.date     "fechavto"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isprinted"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "company_id"
    t.integer  "role_id"
    t.integer  "user_id"
    t.boolean  "current",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["user_id", "company_id", "role_id"], :name => "index_memberships_on_user_id_and_company_id_and_role_id"
  add_index "memberships", ["user_id", "company_id"], :name => "index_memberships_on_user_id_and_company_id"
  add_index "memberships", ["user_id", "role_id"], :name => "index_memberships_on_user_id_and_role_id"

  create_table "notacreditos", :force => true do |t|
    t.integer  "cliente_id"
    t.date     "fecha"
    t.decimal  "importe"
    t.integer  "numero"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recibos", :force => true do |t|
    t.integer  "cliente_id"
    t.date     "fecha"
    t.decimal  "importe"
    t.integer  "numero"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refenciacontables", :force => true do |t|
    t.integer  "company_id"
    t.integer  "account_id"
    t.string   "referencename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasaivas", :force => true do |t|
    t.string   "detalle"
    t.decimal  "porcentaje"
    t.date     "vencimiento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "authentication_token"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
