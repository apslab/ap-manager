class RemoveIvaFromFactura < ActiveRecord::Migration
  def self.up
    remove_column :facturas, :Iva
  end

  def self.down
    add_column :facturas, :Iva, :decimal
  end
end
