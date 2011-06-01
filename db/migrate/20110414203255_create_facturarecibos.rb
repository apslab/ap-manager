class CreateFacturarecibos < ActiveRecord::Migration
  def self.up
    create_table :facturarecibos do |t|
      t.references :factura
      t.date :fecha
      t.decimal :importe
      t.references :recibo

      t.timestamps
    end
  end

  def self.down
    drop_table :facturarecibos
  end
end
