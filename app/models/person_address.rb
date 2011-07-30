class PersonAddress < ActiveRecord::Base
	has_many :people
	has_many :address_types
	has_many :states
  
	validates_presence_of	:person_id, :message => "es un dato requerido"
	validates_presence_of	:address_type_id, :message => "es un dato requerido"
	validates_presence_of	:state_id, :message => "es un dato requerido"
	validates_presence_of	:created_user_id, :message => "es un dato requerido"
end
