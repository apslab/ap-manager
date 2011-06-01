class AddTasaivaFromFacturadetalle < ActiveRecord::Migration
  def self.up
    add_column :facturadetalles, :tasaiva, :string
  end

  def self.down
    remove_column :facturadetalles, :tasaiva
  end
end
