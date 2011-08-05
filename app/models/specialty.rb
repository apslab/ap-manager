class Specialty < ActiveRecord::Base
	belongs_to :companies
	has_many :care_type
	has_many :professional_scheduler
	has_many :professional_speciality
	has_many :service_specialty
	has_many :specialty_nomenclature

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
