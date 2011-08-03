class Currency < ActiveRecord::Base
	has_many :companies

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
