class ProfessionalSpeciality < ActiveRecord::Base
	has_many :professionals
	has_many :specialties

	validates_numericality_of	:professional_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:specialty_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
end
