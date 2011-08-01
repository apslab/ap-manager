class AddressType < ActiveRecord::Base
	belongs_to :person_address

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido"
end
