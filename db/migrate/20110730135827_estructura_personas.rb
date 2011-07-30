class EstructuraPersonas < ActiveRecord::Migration
  def self.up
    create_table :address_types, :force => true do |t|
    t.integer :company_id
    t.string  :name,                        :limit => 128,                     :null => false
    t.string  :code,                        :limit => 8
    t.boolean :default,                                                        :null => true,      :default => false
    end

    create_table :assistance_types, :force => true do |t|
    t.integer :company_id
    t.string  :name,                        :limit => 128,                     :null => false
    t.string  :code,                        :limit => 8
    t.boolean :default,                                                        :null => true,      :default => false
    t.string  :color,                       :limit => 6,                       :null => false
    end

    create_table :attention_modes, :force => true do |t|
    t.integer :company_id
    t.string  :name,                        :limit => 128,                     :null => false
    t.string  :code,                        :limit => 8
    t.boolean :default,                                                        :null => true,      :default => false
    t.timestamps
    end

    create_table :care_types, :force => true do |t|
    t.integer :company_id
    t.string  :name,                        :limit => 128,                     :null => false
    t.string  :code,                        :limit => 8
    t.integer :specialty_id
    t.text    :user_message
    t.text    :print_message
    t.boolean :need_form
    t.boolean :default,                                                        :null => true,      :default => false
    end

    create_table :care_type_details, :force => true do |t|
    t.string  :name,                        :limit => 128,                     :null => false
    t.string  :code,                        :limit => 8
    t.integer :care_type_id,                                                   :null => false
    t.integer :nomenclature_synonym_id
    t.integer :medication_id
    t.integer :disposable
    t.decimal :amount,                      :precision => 18, :scale => 0,     :null => false
    end

    create_table :currencies, :force => true do |t|
    t.integer :company_id
    t.string  :name,                        :limit => 128,                     :null => false
    t.string  :code,                        :limit => 8
    t.boolean :default,                                                        :null => true,      :default => false
    t.timestamps
    end

    create_table :document_types, :force => true do |t|
    t.integer :company_id
    t.string  :name,                        :limit => 128,                     :null => false
    t.string  :code,                        :limit => 8
    t.boolean :default,                                                        :null => true,      :default => false
    t.timestamps
    end

    create_table :email_types, :force => true do |t|
    t.integer :company_id
    t.string  :name,                        :limit => 128,                     :null => false
    t.string  :code,                        :limit => 8
    t.boolean :default,                                                        :null => true,      :default => false
    t.timestamps
    end

    create_table :health_insurances, :force => true do |t|
    t.integer  :company_id
    t.string   :name,                       :limit => 128,                     :null => false
    t.string   :code,                       :limit => 4
    t.date     :valid_until
    t.boolean  :is_particular
    t.boolean  :is_beneficiary
    t.text     :notes
    t.timestamps
    end

    create_table :health_insurance_plans, :force => true do |t|
    t.integer  :health_insurance_id,                                           :null => false
    t.string   :name,                       :limit => 128,                     :null => false
    t.string   :code,                       :limit => 8
    t.date     :valid_since,                                                   :null => false
    t.date     :valid_until
    t.text     :operative_mode
    t.timestamps
    end

    create_table :marital_statuses, :force => true do |t|
    t.integer :company_id
    t.string  :name,                        :limit => 128,                     :null => false
    t.string  :code,                        :limit => 8
    t.boolean :default,                                                        :null => true,      :default => false
    t.timestamps
    end

    create_table :patients, :force => true do |t|
    t.integer :person_id,                                                      :null => false
    t.string  :code,                        :limit => 18,                      :null => false
    t.integer :medical_history
    end

    create_table :patient_health_insurances, :force => true do |t|
    t.integer :patient_id,                                                     :null => false
    t.string  :code,                        :limit => 4,                       :null => false
    t.integer :health_insurance_id,                                            :null => false
    t.integer :health_insurance_plan_id
    t.string  :affiliate_number,            :limit => 20
    end

    create_table :people, :force => true do |t|
    t.string   :code,                       :limit => 18
    t.string   :last_name,                  :limit => 64,                      :null => false
    t.string   :sure_name,                  :limit => 128,                     :null => false
    t.integer  :sex
    t.date     :birthday
    t.date     :death_day
    t.string   :web_site,                   :limit => 128
    t.decimal  :document_number,            :precision => 18, :scale => 0,     :null => false
    t.integer  :document_type_id,                                              :null => false
    t.integer  :marital_status_id
    t.integer  :created_user_id,                                               :null => false
    t.integer  :updated_user_id
    t.text     :notes
    t.timestamps
    end

    create_table :person_addresses, :force => true do |t|
    t.integer  :person_id,                                                     :null => false
    t.integer  :address_type_id,                                               :null => false
    t.integer  :state_id,                                                      :null => false
    t.string   :street,                     :limit => 64
    t.string   :floor,                      :limit => 4
    t.string   :dept,                       :limit => 4
    t.string   :ring,                       :limit => 4
    t.string   :postal_code,                :limit => 16
    t.integer  :created_user_id,                                               :null => false
    t.integer  :updated_user_id
    t.text     :notes
    t.timestamps
    end

    create_table :person_emails, :force => true do |t|
    t.integer  :person_id,                                                     :null => false
    t.integer  :email_type_id,                                                 :null => false
    t.string   :email,                      :limit => 128
    t.integer  :created_user_id,                                               :null => false
    t.integer  :updated_user_id
    t.text     :notes
    t.timestamps
    end

    create_table :person_phones, :force => true do |t|
    t.integer  :person_id,                                                     :null => false
    t.integer  :phone_type_id,                                                 :null => false
    t.string   :phone_number,               :limit => 64
    t.integer  :created_user_id,                                               :null => false
    t.integer  :updated_user_id
    t.text     :notes
    t.timestamps
    end

    create_table :professionals, :force => true do |t|
    t.integer :person_id,                                                      :null => false
    t.string  :code,                        :limit => 18
    t.string  :national_enrollment,         :limit => 16
    t.string  :state_enrollment,            :limit => 16,                      :null => false
    t.boolean :relationship_work
    t.boolean :schedule_appointments,                                          :null => false
    t.boolean :on_demand_appointments,                                         :null => false
    t.boolean :own,                                                            :null => false
    end

    create_table :professional_schedulers, :force => true do |t|
    t.integer  :professional_id,                                               :null => false
    t.integer  :specialty_id,                                                  :null => false
    t.boolean  :d1,                                                            :null => false
    t.boolean  :d2,                                                            :null => false
    t.boolean  :d3,                                                            :null => false
    t.boolean  :d4,                                                            :null => false
    t.boolean  :d5,                                                            :null => false
    t.boolean  :d6,                                                            :null => false
    t.boolean  :d7,                                                            :null => false
    t.integer  :interval_type,                                                 :null => false
    t.integer  :interval_repeat,                                               :null => false
    t.integer  :minutes,                                                       :null => false
    t.boolean  :month_week_periodical,                                         :null => false
    t.boolean  :month_day_periodical,                                          :null => false
    t.integer  :day_of_week,                                                   :null => false
    t.date     :date_since
    t.date     :date_until
    t.decimal  :hour_since,                 :precision => 5, :scale => 2,      :null => false
    t.decimal  :hour_until,                 :precision => 5, :scale => 2,      :null => false
    t.integer  :over_appointment,                                              :null => false
    t.text     :notes,                                                         :null => false
    end

    create_table :professional_specialities, :force => true do |t|
    t.integer :professional_id,                                                :null => false
    t.integer :specialty_id,                                                   :null => false
    t.timestamps
    end

    create_table :professional_attention_modes, :force => true do |t|
    t.integer :professional_id,                                                :null => false
    t.integer :attention_mode_id,                                              :null => false
    t.timestamps
    end

    create_table :professional_validations, :force => true do |t|
    t.integer  :professional_id,                                               :null => false
    t.date     :valid_since
    t.date     :valid_until
    t.timestamps
    end

    create_table :phone_types, :force => true do |t|
    t.integer :company_id
    t.string  :name,                        :limit => 128,                     :null => false
    t.string  :code,                        :limit => 8
    t.boolean :default,                                                        :null => true,      :default => false
    end

    create_table :services, :force => true do |t|
    t.integer :company_id
    t.string  :name,                        :limit => 50,                      :null => false
    t.timestamps
    end

    create_table :service_specialties, :force => true do |t|
    t.integer :service_id
    t.string  :name,                        :limit => 256,                     :null => false
    t.integer :specialty_id
    end

    create_table :specialties, :force => true do |t|
    t.integer :company_id
    t.string  :name,                        :limit => 128,                     :null => false
    t.string  :code,                        :limit => 8
    t.boolean :default,                                                        :null => true,      :default => false
    t.integer :suspension_type_id
    t.text    :notes
    t.timestamps
    end

    create_table :specialty_nomenclatures, :force => true do |t|
    t.integer :specialty_id
    t.string  :name,                        :limit => 256,                     :null => false
    t.integer :service_id
    t.integer :nomenclature_id
    t.string  :ambulatory_or_internship,    :limit => 256,                     :null => false
    end

    create_table :states, :force => true do |t|
    t.integer :country_id,                                                     :null => false
    t.string  :name,                        :limit => 128,                     :null => false
    t.string  :code,                        :limit => 8
    t.timestamps
    end
  end

  def self.down
    drop_table :address_types
    drop_table :assistance_types
    drop_table :attention_modes
    drop_table :care_types
    drop_table :care_type_details
    drop_table :currencies
    drop_table :document_types
    drop_table :email_types
    drop_table :health_insurances
    drop_table :health_insurance_plans
    drop_table :marital_statuses
    drop_table :patients
    drop_table :patient_health_insurances
    drop_table :people
    drop_table :person_addresses
    drop_table :person_emails
    drop_table :person_phones
    drop_table :professionals
    drop_table :professional_schedulers
    drop_table :professional_specialities
    drop_table :professional_attention_modes
    drop_table :professional_validations
    drop_table :phone_types
    drop_table :services
    drop_table :service_specialties
    drop_table :specialties
    drop_table :specialty_nomenclatures
    drop_table :states
  end
end
