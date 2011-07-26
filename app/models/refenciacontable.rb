class Refenciacontable < ActiveRecord::Base
  belongs_to :company
  belongs_to :account
  
  validates_presence_of :referencename, :message => "can't be blank"
  validates_presence_of :company_id
  validates_presence_of :account_id
  
  validates_associated :company
  validates_associated :account

  validates_uniqueness_of :referencename, :scope => [:company_id], :message => "existe la referencia con el cuenta", :allow_nil => true
  
  scope :by_company, lambda {|company| where(:company_id => company.id) }

  cattr_reader :referencias 
  
  def self.referencias
    ['ventas_factura_total','ventas_factura_subtotal','ventas_factura_iva','ventas_factura_iibb','ventas_factura_item',
      'ventas_nc_total','ventas_nc_subtotal','ventas_nc_iva','ventas_nc_iibb','ventas_nc_item',
      'compras_factura_total','compras_factura_subtotal','compras_factura_iva','compras_factura_iibb','compras_factura_item',
      'compras_nc_total','compras_nc_subtotal','compras_nc_iva','compras_nc_iibb','compras_nc_item']
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

