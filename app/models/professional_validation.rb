class ProfessionalValidation < ActiveRecord::Base
	belongs_to :professionals

	validates_numericality_of	:professional_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
end
