class AddEnvelopeToClientes < ActiveRecord::Migration
  def self.up
    add_column :clientes, :envelope, :boolean
  end

  def self.down
    remove_column :clientes, :envelope
  end
end
