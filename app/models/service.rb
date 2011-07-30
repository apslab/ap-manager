class Service < ActiveRecord::Base
  
	validates_presence_of	:name, :case_sensitive => false, :message => "es un dato requerido"
end
