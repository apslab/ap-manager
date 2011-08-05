class Professional < ActiveRecord::Base
	belongs_to :people
	has_many :professional_attention_mode
	has_many :professional_scheduler
	has_many :professional_speciality
	has_many :professional_validation

	validates_numericality_of	:person_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_presence_of		:state_enrollment, :case_sensitive => false, :message => "es un dato requerido."
	validates_presence_of		:schedule_appointments, :message => "es un dato requerido."
	validates_presence_of		:on_demand_appointments, :message => "es un dato requerido."
	validates_presence_of		:own, :message => "es un dato requerido."
end
