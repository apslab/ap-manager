class AddColumnProvinceToClientes < ActiveRecord::Migration
  def self.up
    add_column :clientes, :province_id, :integer
  end

  def self.down
    remove_column :clientes, :province_id
  end
end
