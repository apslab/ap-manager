class Person < ActiveRecord::Base
	has_many :document_types
	has_many :marital_statuses
	belongs_to :patient
	belongs_to :person_address
	belongs_to :person_email
	belongs_to :person_phone
	belongs_to :professional

	validates_presence_of		:last_name, :case_sensitive => false, :message => "es un dato requerido"
	validates_presence_of		:sure_name, :case_sensitive => false, :message => "es un dato requerido"
	validates_numericality_of	:document_number, :greater_than_or_equal_to => 0 , :message => "es un dato requerido"
	validates_numericality_of	:document_type_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido"
	validates_numericality_of	:created_user_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido"
end
