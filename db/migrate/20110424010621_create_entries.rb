class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :description
      t.date :date_on
      t.belongs_to :exercise
      t.integer :details_count, :default => 0
    end

    add_index :entries, :exercise_id
    add_column :exercises, :entries_count, :integer, :default => 0
  end

  def self.down
    drop_table :entries
  end
end

