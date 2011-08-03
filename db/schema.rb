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

ActiveRecord::Schema.define(:version => 20110802175858) do

  create_table "accounts", :force => true do |t|
    t.string  "name"
    t.string  "code"
    t.boolean "archive"
    t.integer "exercise_id"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.integer "details_count", :default => 0
  end

  add_index "accounts", ["exercise_id", "parent_id"], :name => "index_accounts_on_company_id_and_parent_id"
  add_index "accounts", ["exercise_id"], :name => "index_accounts_on_company_id"
  add_index "accounts", ["lft", "rgt"], :name => "index_accounts_on_lft_and_rgt"

  create_table "address_types", :force => true do |t|
    t.integer "company_id"
    t.string  "name",       :limit => 128,                    :null => false
    t.string  "code",       :limit => 8
    t.boolean "default",                   :default => false
  end

  create_table "assistance_types", :force => true do |t|
    t.integer "company_id"
    t.string  "name",       :limit => 128,                    :null => false
    t.string  "code",       :limit => 8
    t.boolean "default",                   :default => false
    t.string  "color",      :limit => 6,                      :null => false
  end

  create_table "attention_modes", :force => true do |t|
    t.integer  "company_id"
    t.string   "name",       :limit => 128,                    :null => false
    t.string   "code",       :limit => 8
    t.boolean  "default",                   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authorizations", :force => true do |t|
    t.string   "code",       :limit => 16,  :null => false
    t.string   "name",       :limit => 128, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "care_type_details", :force => true do |t|
    t.string  "name",                    :limit => 128,                                :null => false
    t.string  "code",                    :limit => 8
    t.integer "care_type_id",                                                          :null => false
    t.integer "nomenclature_synonym_id"
    t.integer "medication_id"
    t.integer "disposable"
    t.decimal "amount",                                 :precision => 18, :scale => 0, :null => false
  end

  create_table "care_types", :force => true do |t|
    t.integer "company_id"
    t.string  "name",          :limit => 128,                    :null => false
    t.string  "code",          :limit => 8
    t.integer "specialty_id"
    t.text    "user_message"
    t.text    "print_message"
    t.boolean "need_form"
    t.boolean "default",                      :default => false
  end

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
    t.string   "email"
    t.string   "fantasyname"
    t.string   "codigopostal"
    t.string   "localidad"
    t.text     "observation"
    t.integer  "province_id"
    t.string   "date_and_time_attention"
    t.boolean  "envelope"
  end

  create_table "clients_companies", :id => false, :force => true do |t|
    t.integer "client_id"
    t.integer "company_id"
  end

  add_index "clients_companies", ["client_id", "company_id"], :name => "index_clients_companies_on_client_id_and_company_id", :unique => true

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exercises_count", :default => 0
    t.integer  "accounts_count",  :default => 0
    t.string   "engines"
  end

  create_table "compra_comprobantes", :force => true do |t|
    t.integer  "supplier_id"
    t.string   "type"
    t.date     "fecha"
    t.decimal  "importe"
    t.integer  "numero"
    t.date     "fechavto"
    t.date     "printed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "compra_detalles", :force => true do |t|
    t.integer  "detallable_id"
    t.string   "detallable_type"
    t.string   "descripcion"
    t.decimal  "cantidad"
    t.decimal  "preciounitario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "tasaiva"
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

  create_table "countries", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", :force => true do |t|
    t.integer  "company_id"
    t.string   "name",       :limit => 128,                    :null => false
    t.string   "code",       :limit => 8
    t.boolean  "default",                   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "details", :force => true do |t|
    t.integer "entry_id"
    t.string  "description"
    t.integer "account_id"
    t.decimal "debit",       :default => 0.0
    t.decimal "credit",      :default => 0.0
  end

  create_table "detalles", :force => true do |t|
    t.integer  "detallable_id"
    t.string   "detallable_type"
    t.string   "descripcion"
    t.decimal  "cantidad"
    t.decimal  "preciounitario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "tasaiva"
    t.integer  "product_id"
  end

  create_table "document_types", :force => true do |t|
    t.integer  "company_id"
    t.string   "name",       :limit => 128,                    :null => false
    t.string   "code",       :limit => 8
    t.boolean  "default",                   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_types", :force => true do |t|
    t.integer  "company_id"
    t.string   "name",       :limit => 128,                    :null => false
    t.string   "code",       :limit => 8
    t.boolean  "default",                   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "health_insurance_plans", :force => true do |t|
    t.integer  "health_insurance_id",                :null => false
    t.string   "name",                :limit => 128, :null => false
    t.string   "code",                :limit => 8
    t.date     "valid_since",                        :null => false
    t.date     "valid_until"
    t.text     "operative_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "health_insurances", :force => true do |t|
    t.integer  "company_id"
    t.string   "name",           :limit => 128, :null => false
    t.string   "code",           :limit => 4
    t.date     "valid_until"
    t.boolean  "is_particular"
    t.boolean  "is_beneficiary"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marital_statuses", :force => true do |t|
    t.integer  "company_id"
    t.string   "name",       :limit => 128,                    :null => false
    t.string   "code",       :limit => 8
    t.boolean  "default",                   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "menu_roles", :force => true do |t|
    t.integer  "menu_id",    :null => false
    t.integer  "rol_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_users", :force => true do |t|
    t.integer  "menu_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", :force => true do |t|
    t.integer  "parent_id"
    t.string   "name",       :limit => 128, :null => false
    t.string   "link_url",   :limit => 128
    t.integer  "order_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notacreditos", :force => true do |t|
    t.integer  "cliente_id"
    t.date     "fecha"
    t.decimal  "importe"
    t.integer  "numero"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_health_insurances", :force => true do |t|
    t.integer "patient_id",                             :null => false
    t.string  "code",                     :limit => 4,  :null => false
    t.integer "health_insurance_id",                    :null => false
    t.integer "health_insurance_plan_id"
    t.string  "affiliate_number",         :limit => 20
  end

  create_table "patients", :force => true do |t|
    t.integer "person_id",                     :null => false
    t.string  "code",            :limit => 18, :null => false
    t.integer "medical_history"
  end

  create_table "people", :force => true do |t|
    t.string   "code",              :limit => 18
    t.string   "last_name",         :limit => 64,                                 :null => false
    t.string   "sure_name",         :limit => 128,                                :null => false
    t.integer  "sex"
    t.date     "birthday"
    t.date     "death_day"
    t.string   "web_site",          :limit => 128
    t.decimal  "document_number",                  :precision => 18, :scale => 0, :null => false
    t.integer  "document_type_id",                                                :null => false
    t.integer  "marital_status_id"
    t.integer  "created_user_id",                                                 :null => false
    t.integer  "updated_user_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_addresses", :force => true do |t|
    t.integer  "person_id",                     :null => false
    t.integer  "address_type_id",               :null => false
    t.integer  "state_id",                      :null => false
    t.string   "street",          :limit => 64
    t.string   "floor",           :limit => 4
    t.string   "dept",            :limit => 4
    t.string   "ring",            :limit => 4
    t.string   "postal_code",     :limit => 16
    t.integer  "created_user_id",               :null => false
    t.integer  "updated_user_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_emails", :force => true do |t|
    t.integer  "person_id",                      :null => false
    t.integer  "email_type_id",                  :null => false
    t.string   "email",           :limit => 128
    t.integer  "created_user_id",                :null => false
    t.integer  "updated_user_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_phones", :force => true do |t|
    t.integer  "person_id",                     :null => false
    t.integer  "phone_type_id",                 :null => false
    t.string   "phone_number",    :limit => 64
    t.integer  "created_user_id",               :null => false
    t.integer  "updated_user_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_types", :force => true do |t|
    t.integer "company_id"
    t.string  "name",       :limit => 128,                    :null => false
    t.string  "code",       :limit => 8
    t.boolean "default",                   :default => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "observation"
    t.integer  "company_id"
    t.date     "since"
    t.date     "until"
    t.integer  "tasaiva_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price"
    t.string   "code"
  end

  create_table "professional_attention_modes", :force => true do |t|
    t.integer  "professional_id",   :null => false
    t.integer  "attention_mode_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professional_schedulers", :force => true do |t|
    t.integer "professional_id",                                     :null => false
    t.integer "specialty_id",                                        :null => false
    t.boolean "d1",                                                  :null => false
    t.boolean "d2",                                                  :null => false
    t.boolean "d3",                                                  :null => false
    t.boolean "d4",                                                  :null => false
    t.boolean "d5",                                                  :null => false
    t.boolean "d6",                                                  :null => false
    t.boolean "d7",                                                  :null => false
    t.integer "interval_type",                                       :null => false
    t.integer "interval_repeat",                                     :null => false
    t.integer "minutes",                                             :null => false
    t.boolean "month_week_periodical",                               :null => false
    t.boolean "month_day_periodical",                                :null => false
    t.integer "day_of_week",                                         :null => false
    t.date    "date_since"
    t.date    "date_until"
    t.decimal "hour_since",            :precision => 5, :scale => 2, :null => false
    t.decimal "hour_until",            :precision => 5, :scale => 2, :null => false
    t.integer "over_appointment",                                    :null => false
    t.text    "notes",                                               :null => false
  end

  create_table "professional_specialities", :force => true do |t|
    t.integer  "professional_id", :null => false
    t.integer  "specialty_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professional_validations", :force => true do |t|
    t.integer  "professional_id", :null => false
    t.date     "valid_since"
    t.date     "valid_until"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professionals", :force => true do |t|
    t.integer "person_id",                            :null => false
    t.string  "code",                   :limit => 18
    t.string  "national_enrollment",    :limit => 16
    t.string  "state_enrollment",       :limit => 16, :null => false
    t.boolean "relationship_work"
    t.boolean "schedule_appointments",                :null => false
    t.boolean "on_demand_appointments",               :null => false
    t.boolean "own",                                  :null => false
  end

  create_table "provinces", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "country_id"
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
    t.boolean  "debita"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_specialties", :force => true do |t|
    t.integer "service_id"
    t.string  "name",         :limit => 256, :null => false
    t.integer "specialty_id"
  end

  create_table "services", :force => true do |t|
    t.integer  "company_id"
    t.string   "name",       :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialties", :force => true do |t|
    t.integer  "company_id"
    t.string   "name",               :limit => 128,                    :null => false
    t.string   "code",               :limit => 8
    t.boolean  "default",                           :default => false
    t.integer  "suspension_type_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialty_nomenclatures", :force => true do |t|
    t.integer "specialty_id"
    t.string  "name",                     :limit => 256, :null => false
    t.integer "service_id"
    t.integer "nomenclature_id"
    t.string  "ambulatory_or_internship", :limit => 256, :null => false
  end

  create_table "states", :force => true do |t|
    t.integer  "country_id",                :null => false
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "codigo"
    t.string   "razonsocial"
    t.string   "cuit"
    t.string   "telefono"
    t.string   "direccion"
    t.string   "contacto"
    t.integer  "condicioniva_id"
    t.integer  "account_id"
    t.integer  "empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasaivas", :force => true do |t|
    t.string   "detalle"
    t.decimal  "porcentaje"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "account_id"
    t.date     "since"
    t.date     "until"
  end

  create_table "user_authorizations", :force => true do |t|
    t.integer  "user_id",          :null => false
    t.integer  "authorization_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.integer  "rol_id",                        :null => false
    t.boolean  "is_active",  :default => false
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
