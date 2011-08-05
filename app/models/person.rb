class Person < ActiveRecord::Base
	belongs_to :document_types
	belongs_to :marital_statuses
	has_many :patient
	has_many :person_address
	has_many :person_email
	has_many :person_phone
	has_many :professional

	validates_presence_of		:last_name, :case_sensitive => false, :message => "es un dato requerido."
	validates_presence_of		:sure_name, :case_sensitive => false, :message => "es un dato requerido."
	validates_numericality_of	:document_number, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:document_type_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:created_user_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
end
