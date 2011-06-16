class AddColumnAccountToTasaivas < ActiveRecord::Migration
  def self.up
    add_column :tasaivas, :account_id, :integer
  end

  def self.down
    remove_column :tasaivas, :account_id
  end
end
