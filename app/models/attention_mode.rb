class AttentionMode < ActiveRecord::Base
	belongs_to :companies
	has_many :professional_attention_mode

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
