class AddCondicionivaToCliente < ActiveRecord::Migration
  def self.up
    add_column :clientes, :condicioniva_id, :integer
  end

  def self.down
    remove_column :clientes, :condicioniva_id
  end
end
