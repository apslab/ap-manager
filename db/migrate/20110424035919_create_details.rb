class CreateDetails < ActiveRecord::Migration
  def self.up
    create_table :details do |t|
      t.belongs_to :entry
      t.string :description
      t.belongs_to :account
      t.decimal :incoming
      t.decimal :outcoming
    end

    add_index :details, :entry_id
    add_index :details, :account_id
  end

  def self.down
    drop_table :details
  end
end

