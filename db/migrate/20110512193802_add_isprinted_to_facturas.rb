class AddIsprintedToFacturas < ActiveRecord::Migration
  def self.up
    add_column :facturas, :isprinted, :boolean
  end

  def self.down
    remove_column :facturas, :isprinted
  end
end
