class CreateFacturas < ActiveRecord::Migration
  def self.up
    create_table :facturas do |t|
      t.references :cliente
      t.date :fecha
      t.decimal :importe
      t.integer :numero
      t.date :fechavto

      t.timestamps
    end
  end

  def self.down
    drop_table :facturas
  end
end
