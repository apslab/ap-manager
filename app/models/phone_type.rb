class PhoneType < ActiveRecord::Base
	has_many :companies
	belongs_to :person_phone

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
