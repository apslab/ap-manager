class Person < ActiveRecord::Base
	has_many :document_types
	has_many :marital_statuses
  
	validates_presence_of	:last_name, :case_sensitive => false, :message => "es un dato requerido"
	validates_presence_of	:sure_name, :case_sensitive => false, :message => "es un dato requerido"
	validates_presence_of	:document_number, :message => "es un dato requerido"
	validates_presence_of	:document_type_id, :message => "es un dato requerido"
	validates_presence_of	:created_user_id, :message => "es un dato requerido"
end
