class RemoveColumnVencimientoToTasaivas < ActiveRecord::Migration
  def self.up
    remove_column :tasaivas, :vencimiento
  end

  def self.down
    add_column :tasaivas, :vencimiento, :date
  end
end
