class CreateComprobantes < ActiveRecord::Migration
  def self.up
    create_table :comprobantes do |t|
      t.references :cliente
      t.string :type
      t.date :fecha
      t.decimal :importe
      t.integer :numero
      t.date :fechavto
      t.date  :printed_at

      t.timestamps
    end
  end

  def self.down
    drop_table :comprobantes
  end
end
