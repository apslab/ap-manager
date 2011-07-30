class HealthInsurancePlan < ActiveRecord::Base
	has_many :health_insurances
  
	validates_presence_of	:health_insurance_id, :message => "es un dato requerido"
	validates_presence_of	:name, :case_sensitive => false, :message => "es un dato requerido"
	validates_presence_of	:valid_since, :message => "es un dato requerido"
end
