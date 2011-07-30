class SpecialtyNomenclature < ActiveRecord::Base
	has_many :specialties
	has_many :services
  
	validates_presence_of	:name, :case_sensitive => false, :message => "es un dato requerido"
	validates_presence_of	:ambulatory_or_internship, :case_sensitive => false, :message => "es un dato requerido"
end
