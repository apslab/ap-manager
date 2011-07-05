class AddColumnEmailToClientes < ActiveRecord::Migration
  def self.up
    add_column :clientes, :email, :string
  end

  def self.down
    remove_column :clientes, :email
  end
end
