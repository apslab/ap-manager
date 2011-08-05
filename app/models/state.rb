class State < ActiveRecord::Base
	has_many :person_address

	validates_numericality_of	:country_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
