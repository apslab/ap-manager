class DocumentType < ActiveRecord::Base
	has_many :companies
	belongs_to :person

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
