class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.integer :company_id
      t.integer :role_id
      t.integer :user_id
      t.boolean :current, :default => false

      t.timestamps
    end

    add_index :memberships, [:user_id, :company_id, :role_id]
    add_index :memberships, [:user_id, :role_id]
    add_index :memberships, [:user_id, :company_id]
  end

  def self.down
    drop_table :memberships
  end
end

