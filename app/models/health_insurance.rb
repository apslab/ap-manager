class HealthInsurance < ActiveRecord::Base
	belongs_to :companies
	has_many :health_insurance_plan
	has_many :patient_health_insurance

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
