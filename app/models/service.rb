class Service < ActiveRecord::Base
	belongs_to :companies
	has_many :service_specialty
	has_many :specialty_nomenclature

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
