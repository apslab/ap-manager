class CreateClientes < ActiveRecord::Migration
  def self.up
    create_table :clientes do |t|
      t.string :codigo
      t.string :razonsocial
      t.string :cuit
      t.string :telefono
      t.string :direccion
      t.string :contacto

      t.timestamps
    end
  end

  def self.down
    drop_table :clientes
  end
end
