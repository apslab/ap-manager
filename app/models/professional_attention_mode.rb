class ProfessionalAttentionMode < ActiveRecord::Base
	belongs_to :professionals
	belongs_to :attention_modes

	validates_numericality_of	:professional_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:attention_mode_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
end
