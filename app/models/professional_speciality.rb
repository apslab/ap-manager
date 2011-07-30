class ProfessionalSpeciality < ActiveRecord::Base
	has_many :professionals
	has_many :specialties
  
	validates_presence_of	:professional_id, :message => "es un dato requerido"
	validates_presence_of	:specialty_id, :message => "es un dato requerido"
end
