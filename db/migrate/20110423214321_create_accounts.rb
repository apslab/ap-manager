class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :code
      t.boolean :archive
      t.belongs_to :company
      t.integer :parent_id, :lft, :rgt, :depth
    end

    add_index :accounts, :company_id
    add_index :accounts, [:lft, :rgt]
    add_index :accounts, [:company_id, :parent_id]

    add_column :companies, :accounts_count, :integer, :default => 0
  end

  def self.down
    drop_table :accounts
    remove_column :comanies, :accounts_count
  end
end

