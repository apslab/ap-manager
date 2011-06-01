class AddLetra1ToCondicioniva < ActiveRecord::Migration
  def self.up
    add_column :condicionivas, :letra, :string
  end

  def self.down
    remove_column :condicionivas, :letra
  end
end
