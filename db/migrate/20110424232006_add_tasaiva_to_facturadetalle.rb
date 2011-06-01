class AddTasaivaToFacturadetalle < ActiveRecord::Migration
  def self.up
    add_column :facturadetalles, :tasaiva, :decimal
  end

  def self.down
    remove_column :facturadetalles, :tasaiva
  end
end
