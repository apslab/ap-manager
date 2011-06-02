class RemoveCurrentToComapnies < ActiveRecord::Migration
  def self.up
    remove_column :companies, :current
  end

  def self.down
    add_column :companies, :current, :boolean
  end
end
