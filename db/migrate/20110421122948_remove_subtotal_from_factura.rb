class RemoveSubtotalFromFactura < ActiveRecord::Migration
  def self.up
    remove_column :facturas, :Subtotal
  end

  def self.down
    add_column :facturas, :Subtotal, :decimal
  end
end
