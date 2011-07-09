class AddColumnobservationToClientes < ActiveRecord::Migration
  def self.up
    add_column :clientes, :observation, :text
  end

  def self.down
    remove_column :clientes, :observation
  end
end
