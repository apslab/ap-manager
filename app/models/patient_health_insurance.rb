class PatientHealthInsurance < ActiveRecord::Base
	has_many :patients
	has_many :health_insurances
	has_many :health_insurance_plans

	validates_numericality_of	:patient_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido"
	validates_presence_of		:code, :case_sensitive => false, :message => "es un dato requerido"
	validates_numericality_of	:health_insurance_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido"
end
