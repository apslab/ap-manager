class AddTasaivaFromFactura < ActiveRecord::Migration
  def self.up
    add_column :facturas, :tasaiva, :string
  end

  def self.down
    remove_column :facturas, :tasaiva
  end
end
