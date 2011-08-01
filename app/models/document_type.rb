class DocumentType < ActiveRecord::Base
	belongs_to :person

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido"
end
