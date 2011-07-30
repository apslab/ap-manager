class PersonEmail < ActiveRecord::Base
	has_many :people
	has_many :email_types
  
	validates_presence_of	:person_id, :message => "es un dato requerido"
	validates_presence_of	:email_type_id, :message => "es un dato requerido"
	validates_presence_of	:created_user_id, :message => "es un dato requerido"
end
