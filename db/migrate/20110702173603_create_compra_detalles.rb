class CreateCompraDetalles < ActiveRecord::Migration
  def self.up
    create_table :compra_detalles do |t|
      t.integer  "detallable_id"
      t.string   "detallable_type"
      t.string   "descripcion"
      t.decimal  "cantidad"
      t.decimal  "preciounitario"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.decimal  "tasaiva"
      t.timestamps
    end
  end

  def self.down
    drop_table :compra_detalles
  end
end
