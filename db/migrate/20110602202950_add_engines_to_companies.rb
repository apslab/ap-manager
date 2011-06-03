class AddEnginesToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :engines, :string
  end

  def self.down
    remove_column :companies, :engines
  end
end
