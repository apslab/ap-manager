class HealthInsurance < ActiveRecord::Base
	belongs_to :health_insurance_plan
	belongs_to :patient_health_insurance

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido"
end
