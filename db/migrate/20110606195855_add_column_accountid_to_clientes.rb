class AddColumnAccountidToClientes < ActiveRecord::Migration
  def self.up
    add_column :clientes, :account_id, :integer
  end

  def self.down
    remove_column :clientes, :account_id
  end
end
