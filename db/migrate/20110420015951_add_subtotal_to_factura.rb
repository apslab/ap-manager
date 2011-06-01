class AddSubtotalToFactura < ActiveRecord::Migration
  def self.up
    add_column :facturas, :Subtotal, :decimal
  end

  def self.down
    remove_column :facturas, :Subtotal
  end
end
