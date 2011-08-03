class PersonAddress < ActiveRecord::Base
	has_many :people
	has_many :address_types
	has_many :states

	validates_numericality_of	:person_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:address_type_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:state_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:created_user_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
end
