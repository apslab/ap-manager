class CreateNotacreditos < ActiveRecord::Migration
  def self.up
    create_table :notacreditos do |t|
      t.references :cliente
      t.date :fecha
      t.decimal :importe
      t.integer :numero

      t.timestamps
    end
  end

  def self.down
    drop_table :notacreditos
  end
end
