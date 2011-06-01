class CreateTasaivas < ActiveRecord::Migration
  def self.up
    create_table :tasaivas do |t|
      t.string :detalle
      t.decimal :porcentaje
      t.date :vencimiento

      t.timestamps
    end
  end

  def self.down
    drop_table :tasaivas
  end
end
