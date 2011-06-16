class AddColumnVigenciaToTasaivas < ActiveRecord::Migration
  def self.up
    add_column :tasaivas, :vigencia, :date
  end

  def self.down
    remove_column :tasaivas, :vigencia
  end
end
