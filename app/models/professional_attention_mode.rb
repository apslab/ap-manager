class ProfessionalAttentionMode < ActiveRecord::Base
	has_many :professionals
	has_many :attention_modes
  
	validates_presence_of	:professional_id, :message => "es un dato requerido"
	validates_presence_of	:attention_mode_id, :message => "es un dato requerido"
end
