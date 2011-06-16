class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :observation
      t.integer :company_id
      t.date :since
      t.date :until
      t.integer :tasaiva_id
      t.integer :account_id

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
