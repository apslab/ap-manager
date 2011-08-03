class Service < ActiveRecord::Base
	has_many :companies
	belongs_to :service_specialty
	belongs_to :specialty_nomenclature

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
