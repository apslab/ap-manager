class CareType < ActiveRecord::Base
	has_many :companies
	has_many :specialties
	belongs_to :care_type_detail

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
