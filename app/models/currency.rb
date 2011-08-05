class Currency < ActiveRecord::Base
	belongs_to :companies

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
