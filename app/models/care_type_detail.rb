class CareTypeDetail < ActiveRecord::Base
	has_many :care_types
  
	validates_presence_of	:name, :case_sensitive => false, :message => "es un dato requerido"
	validates_presence_of	:care_type_id, :message => "es un dato requerido"
	validates_presence_of	:amount, :message => "es un dato requerido"
end
