class EmailType < ActiveRecord::Base
	belongs_to :person_email

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido"
end
