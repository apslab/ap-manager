class AddHasAndBelongsToManyClients2Companies < ActiveRecord::Migration
  def self.up
    create_table :clients_companies, :id => false do |t|
      t.column :client_id, :integer
      t.column :company_id, :integer
    end

    add_index :clients_companies, [:client_id,:company_id], :unique => true
  end

  def self.down
    drop_table :clients_companies
  end
end

