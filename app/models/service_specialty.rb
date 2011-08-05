class ServiceSpecialty < ActiveRecord::Base
	belongs_to :services
	belongs_to :specialties

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
