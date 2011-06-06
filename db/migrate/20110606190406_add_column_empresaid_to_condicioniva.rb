class AddColumnEmpresaidToCondicioniva < ActiveRecord::Migration
  def self.up
    add_column :condicionivas, :empresa_id, :integer
  end

  def self.down
    remove_column :condicionivas, :empresa_id
  end
end
