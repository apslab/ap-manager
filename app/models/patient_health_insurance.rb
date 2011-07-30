class PatientHealthInsurance < ActiveRecord::Base
	has_many :patients
	has_many :health_insurances
	has_many :health_insurance_plans
  
	validates_presence_of	:patient_id, :message => "es un dato requerido"
	validates_presence_of	:code, :case_sensitive => false, :message => "es un dato requerido"
	validates_presence_of	:health_insurance_id, :message => "es un dato requerido"
end
