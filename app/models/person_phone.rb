class PersonPhone < ActiveRecord::Base
	belongs_to :people
	belongs_to :phone_types

	validates_numericality_of	:person_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:phone_type_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:created_user_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
end
