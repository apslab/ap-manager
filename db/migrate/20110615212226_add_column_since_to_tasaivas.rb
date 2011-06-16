class AddColumnSinceToTasaivas < ActiveRecord::Migration
  def self.up
    add_column :tasaivas, :since, :date
  end

  def self.down
    remove_column :tasaivas, :since
  end
end
