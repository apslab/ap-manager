class CareTypeDetail < ActiveRecord::Base
	has_many :care_types

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
	validates_numericality_of	:care_type_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:amount, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
end
