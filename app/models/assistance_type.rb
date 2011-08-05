class AssistanceType < ActiveRecord::Base
	belongs_to :companies

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
	validates_presence_of		:color, :case_sensitive => false, :message => "es un dato requerido."
end
