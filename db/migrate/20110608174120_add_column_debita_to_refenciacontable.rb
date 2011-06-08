class AddColumnDebitaToRefenciacontable < ActiveRecord::Migration
  def self.up
    add_column :refenciacontables, :debita, :boolean
  end

  def self.down
    remove_column :refenciacontables, :debita
  end
end
