class AddIvaToFactura < ActiveRecord::Migration
  def self.up
    add_column :facturas, :Iva, :decimal
  end

  def self.down
    remove_column :facturas, :Iva
  end
end
