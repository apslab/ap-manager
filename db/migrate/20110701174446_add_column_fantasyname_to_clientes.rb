class AddColumnFantasynameToClientes < ActiveRecord::Migration
  def self.up
    add_column :clientes, :fantasyname, :string
  end

  def self.down
    remove_column :clientes, :fantasyname
  end
end
