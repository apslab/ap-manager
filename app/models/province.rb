class Province < ActiveRecord::Base
  belongs_to :country
  has_many :clientes
  has_many :suppliers
end
