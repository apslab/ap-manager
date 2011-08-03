class Patient < ActiveRecord::Base
	has_many :people
	belongs_to :patient_health_insurance

	validates_numericality_of	:person_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_presence_of		:code, :case_sensitive => false, :message => "es un dato requerido."
end
