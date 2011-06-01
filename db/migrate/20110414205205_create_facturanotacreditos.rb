class CreateFacturanotacreditos < ActiveRecord::Migration
  def self.up
    create_table :facturanotacreditos do |t|
      t.references :factura
      t.date :fecha
      t.decimal :importe
      t.references :notacredito

      t.timestamps
    end
  end

  def self.down
    drop_table :facturanotacreditos
  end
end
