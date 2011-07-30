class State < ActiveRecord::Base
  
	validates_presence_of	:country_id, :message => "es un dato requerido"
	validates_presence_of	:name, :case_sensitive => false, :message => "es un dato requerido"
end
