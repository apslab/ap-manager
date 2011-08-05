class EmailType < ActiveRecord::Base
	belongs_to :companies
	has_many :person_email

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
