class CreateExercises < ActiveRecord::Migration
  def self.up
    create_table :exercises do |t|
      t.date :started_on, :finished_on
      t.boolean :uneven, :close, :default => false
      t.belongs_to :company
    end

    add_index :exercises, :company_id
    add_index :exercises, :close
    add_index :exercises, [:company_id, :close]
    add_index :exercises, [:company_id, :started_on, :finished_on], :unique => true
    add_column :companies, :exercises_count, :integer, :default => 0
  end

  def self.down
    drop_table :exercises
    remove_column :companies, :exercises_count
  end
end

