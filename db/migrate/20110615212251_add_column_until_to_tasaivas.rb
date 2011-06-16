class AddColumnUntilToTasaivas < ActiveRecord::Migration
  def self.up
    add_column :tasaivas, :until, :date
  end

  def self.down
    remove_column :tasaivas, :until
  end
end
