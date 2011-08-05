class CareType < ActiveRecord::Base
	belongs_to :companies
	belongs_to :specialties
	has_many :care_type_detail

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
