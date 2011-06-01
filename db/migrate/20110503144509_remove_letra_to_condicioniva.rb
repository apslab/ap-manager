class RemoveLetraToCondicioniva < ActiveRecord::Migration
  def self.up
    remove_column :condicionivas, :lectra
  end

  def self.down
    add_column :condicionivas, :lectra, :string
  end
end
