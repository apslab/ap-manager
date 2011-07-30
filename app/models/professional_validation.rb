class ProfessionalValidation < ActiveRecord::Base
	has_many :professionals
  
	validates_presence_of	:professional_id, :message => "es un dato requerido"
end
