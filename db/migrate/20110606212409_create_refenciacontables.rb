class CreateRefenciacontables < ActiveRecord::Migration
  def self.up
    create_table :refenciacontables do |t|
      t.integer :company_id
      t.integer :account_id
      t.string :referencename

      t.timestamps
    end
  end

  def self.down
    drop_table :refenciacontables
  end
end
