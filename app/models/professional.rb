class Professional < ActiveRecord::Base
	has_many :people
  
	validates_presence_of	:person_id, :message => "es un dato requerido"
	validates_presence_of	:state_enrollment, :case_sensitive => false, :message => "es un dato requerido"
	validates_presence_of	:schedule_appointments, :message => "es un dato requerido"
	validates_presence_of	:on_demand_appointments, :message => "es un dato requerido"
	validates_presence_of	:own, :message => "es un dato requerido"
end
