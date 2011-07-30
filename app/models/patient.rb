class Patient < ActiveRecord::Base
	has_many :people
  
	validates_presence_of	:person_id, :message => "es un dato requerido"
	validates_presence_of	:code, :case_sensitive => false, :message => "es un dato requerido"
end
