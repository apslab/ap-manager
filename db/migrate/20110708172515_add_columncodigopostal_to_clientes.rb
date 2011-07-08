class AddColumncodigopostalToClientes < ActiveRecord::Migration
  def self.up
    add_column :clientes, :codigopostal, :string
  end

  def self.down
    remove_column :clientes, :codigopostal
  end
end
