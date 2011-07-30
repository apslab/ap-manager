class ProfessionalScheduler < ActiveRecord::Base
	has_many :professionals
	has_many :specialties
  
	validates_presence_of	:professional_id, :message => "es un dato requerido"
	validates_presence_of	:specialty_id, :message => "es un dato requerido"
	validates_presence_of	:d1, :message => "es un dato requerido"
	validates_presence_of	:d2, :message => "es un dato requerido"
	validates_presence_of	:d3, :message => "es un dato requerido"
	validates_presence_of	:d4, :message => "es un dato requerido"
	validates_presence_of	:d5, :message => "es un dato requerido"
	validates_presence_of	:d6, :message => "es un dato requerido"
	validates_presence_of	:d7, :message => "es un dato requerido"
	validates_presence_of	:interval_type, :message => "es un dato requerido"
	validates_presence_of	:interval_repeat, :message => "es un dato requerido"
	validates_presence_of	:minutes, :message => "es un dato requerido"
	validates_presence_of	:month_week_periodical, :message => "es un dato requerido"
	validates_presence_of	:month_day_periodical, :message => "es un dato requerido"
	validates_presence_of	:day_of_week, :message => "es un dato requerido"
	validates_presence_of	:hour_since, :message => "es un dato requerido"
	validates_presence_of	:hour_until, :message => "es un dato requerido"
	validates_presence_of	:over_appointment, :message => "es un dato requerido"
	validates_presence_of	:notes, :case_sensitive => false, :message => "es un dato requerido"
end
