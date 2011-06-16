class Product < ActiveRecord::Base
  belongs_to :account
  belongs_to :company
  belongs_to :tasaiva
  
  has_many :detalles, :as => :detallable
    
  validates :name, :presence => true
  validates :since, :presence => true
  
  scope :by_company, lambda {|company| where(:company_id => company.id) }

  def _account_id
    _read_attribute(:account_id) || Refenciacontable.find_by_referencename_and_company_id('ventas_factura_subtotal',read_attribute(:company_id)).try(:account_id)
  end
  
end

# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  observation :text
#  company_id  :integer
#  since       :date
#  until       :date
#  tasaiva_id  :integer
#  account_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

