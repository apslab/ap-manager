class AddColumnlocalidadToClientes < ActiveRecord::Migration
  def self.up
    add_column :clientes, :localidad, :string
  end

  def self.down
    remove_column :clientes, :localidad
  end
end
