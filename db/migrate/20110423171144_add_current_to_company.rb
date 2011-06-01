class AddCurrentToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :current, :boolean, :default => false
  end

  def self.down
    remove_column :companies, :current
  end
end

