class CreateComprobantescp < ActiveRecord::Migration
  def self.up
    create_table :comprobantescp do |t|
      t.references :supplier
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
    drop_table :comprobantescp
  end
end
