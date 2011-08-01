class Professional < ActiveRecord::Base
	has_many :people
	belongs_to :professional_attention_mode
	belongs_to :professional_scheduler
	belongs_to :professional_speciality
	belongs_to :professional_validation

	validates_numericality_of	:person_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido"
	validates_presence_of		:state_enrollment, :case_sensitive => false, :message => "es un dato requerido"
	validates_presence_of		:schedule_appointments, :message => "es un dato requerido"
	validates_presence_of		:on_demand_appointments, :message => "es un dato requerido"
	validates_presence_of		:own, :message => "es un dato requerido"
end
