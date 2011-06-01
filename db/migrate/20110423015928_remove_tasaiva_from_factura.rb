class RemoveTasaivaFromFactura < ActiveRecord::Migration
  def self.up
    remove_column :facturas, :tasaiva
  end

  def self.down
    add_column :facturas, :tasaiva, :string
  end
end
