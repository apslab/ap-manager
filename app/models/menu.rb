class Menu < ActiveRecord::Base
	has_many :menu_role
	has_many :menu_user

	validates_presence_of		:name, :case_sensitive => false, :message => "es un dato requerido."
end
