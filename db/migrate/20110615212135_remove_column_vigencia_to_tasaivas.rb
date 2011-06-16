class RemoveColumnVigenciaToTasaivas < ActiveRecord::Migration
  def self.up
    remove_column :tasaivas, :vigencia
  end

  def self.down
    add_column :tasaivas, :vigencia, :date
  end
end
