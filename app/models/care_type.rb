class CareType < ActiveRecord::Base
	has_many :specialties
  
	validates_presence_of	:name, :case_sensitive => false, :message => "es un dato requerido"
	validates_presence_of	:default, :message => "es un dato requerido"
end
