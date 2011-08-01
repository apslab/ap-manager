class HealthInsurancePlan < ActiveRecord::Base
	has_many :health_insurances
	belongs_to :patient_health_insurance

	validates_numericality_of	:health_insurance_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido"
	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido"
	validates_presence_of		:valid_since, :message => "es un dato requerido"
end
