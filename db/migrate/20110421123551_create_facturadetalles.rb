class CreateFacturadetalles < ActiveRecord::Migration
  def self.up
    create_table :facturadetalles do |t|
      t.references :factura
      t.string :descripcion
      t.decimal :cantidad
      t.decimal :preciounitario

      t.timestamps
    end
  end

  def self.down
    drop_table :facturadetalles
  end
end
