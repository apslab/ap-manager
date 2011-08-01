class PersonEmail < ActiveRecord::Base
	has_many :people
	has_many :email_types

	validates_numericality_of	:person_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido"
	validates_numericality_of	:email_type_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido"
	validates_numericality_of	:created_user_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido"
end
