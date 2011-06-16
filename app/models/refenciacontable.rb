class Refenciacontable < ActiveRecord::Base
  belongs_to :company
  belongs_to :account
  
  validates_presence_of :referencename, :message => "can't be blank"
  validates_presence_of :company_id
  validates_presence_of :account_id
  
  validates_associated :company
  validates_associated :account
  
  scope :by_company, lambda {|company| where(:company_id => company.id) }

  cattr_reader :referencias 
  
  def self.referencias
    ['ventas_factura_total','ventas_factura_subtotal','ventas_factura_iva','ventas_factura_iibb','ventas_factura_item']
  end
end

# == Schema Information
#
# Table name: refenciacontables
#
#  id            :integer         not null, primary key
#  company_id    :integer
#  account_id    :integer
#  referencename :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  debita        :boolean
#

