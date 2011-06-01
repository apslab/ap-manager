class RemoveTasaivaToFacturadetalle < ActiveRecord::Migration
  def self.up
    remove_column :facturadetalles, :tasaiva
  end

  def self.down
    add_column :facturadetalles, :tasaiva, :string
  end
end
