class ServiceSpecialty < ActiveRecord::Base
	has_many :services
	has_many :specialties
  
	validates_presence_of	:name, :case_sensitive => false, :message => "es un dato requerido"
end
