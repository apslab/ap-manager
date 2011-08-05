class ProfessionalScheduler < ActiveRecord::Base
	belongs_to :professionals
	belongs_to :specialties

	validates_numericality_of	:professional_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:specialty_id, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_presence_of		:d1, :message => "es un dato requerido."
	validates_presence_of		:d2, :message => "es un dato requerido."
	validates_presence_of		:d3, :message => "es un dato requerido."
	validates_presence_of		:d4, :message => "es un dato requerido."
	validates_presence_of		:d5, :message => "es un dato requerido."
	validates_presence_of		:d6, :message => "es un dato requerido."
	validates_presence_of		:d7, :message => "es un dato requerido."
	validates_numericality_of	:interval_type, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:interval_repeat, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:minutes, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_presence_of		:month_week_periodical, :message => "es un dato requerido."
	validates_presence_of		:month_day_periodical, :message => "es un dato requerido."
	validates_numericality_of	:day_of_week, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:hour_since, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:hour_until, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_numericality_of	:over_appointment, :greater_than_or_equal_to => 0 , :message => "es un dato requerido."
	validates_presence_of		:notes, :case_sensitive => false, :message => "es un dato requerido."
end
