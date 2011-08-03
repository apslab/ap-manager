class ProfessionalValidation < ActiveRecord::Base
	has_many :professionals

	validates_numericality_of	:professional_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
end
