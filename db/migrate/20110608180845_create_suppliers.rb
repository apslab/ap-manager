class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :codigo
      t.string :razonsocial
      t.string :cuit
      t.string :telefono
      t.string :direccion
      t.string :contacto
      t.integer :condicioniva_id
      t.integer :account_id
      t.integer :empresa_id

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end
