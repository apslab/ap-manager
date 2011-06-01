class AddLetraToCondicioniva < ActiveRecord::Migration
  def self.up
    add_column :condicionivas, :lectra, :string
  end

  def self.down
    remove_column :condicionivas, :lectra
  end
end
