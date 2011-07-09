class AddColumnDatetimeattentionToClientes < ActiveRecord::Migration
  def self.up
    add_column :clientes, :date_and_time_attention, :string
  end

  def self.down
    remove_column :clientes, :date_and_time_attention
  end
end
