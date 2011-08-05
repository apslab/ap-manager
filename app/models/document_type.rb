class DocumentType < ActiveRecord::Base
	belongs_to :companies
	has_many :person

	validates_presence_of	  :name, :case_sensitive => false, :message => "es un dato requerido."
  #validates_uniqueness_of  :default, :scope => :company_id, :message => "Existente"
end
