class AddDescriptionToExercises < ActiveRecord::Migration
  def self.up
    add_column :exercises, :description, :string
  end

  def self.down
    remove_column :exercises, :description
  end
end
