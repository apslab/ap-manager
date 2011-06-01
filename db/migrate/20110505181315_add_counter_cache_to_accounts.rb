class AddCounterCacheToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :details_count, :integer, :default => 0
  end

  def self.down
    remove_column :accounts, :details_count
  end
end

