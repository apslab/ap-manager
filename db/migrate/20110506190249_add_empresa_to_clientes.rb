class AddEmpresaToClientes < ActiveRecord::Migration
  def self.up
    add_column :clientes, :empresa_id, :integer
  end

  def self.down
    remove_column :clientes, :empresa_id
  end
end
