class RemoveImporteFromFactura < ActiveRecord::Migration
  def self.up
    remove_column :facturas, :importe
  end

  def self.down
    add_column :facturas, :importe, :string
  end
end
