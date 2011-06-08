class Refenciacontable < ActiveRecord::Base
  belongs_to :company
  belongs_to :account
  
  validates_presence_of :referencename, :message => "can't be blank"
  validates_presence_of :company_id
  validates_presence_of :account_id
  
  validates_associated :company
  validates_associated :account
  
  scope :by_company, lambda {|company| where(:company_id => company.id) }
end
