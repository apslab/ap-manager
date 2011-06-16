class AddColumnProductToDetalles < ActiveRecord::Migration
  def self.up
    add_column :detalles, :product_id, :integer
  end

  def self.down
    remove_column :detalles, :product_id
  end
end
