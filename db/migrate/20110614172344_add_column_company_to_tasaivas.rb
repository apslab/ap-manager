class AddColumnCompanyToTasaivas < ActiveRecord::Migration
  def self.up
    add_column :tasaivas, :company_id, :integer
  end

  def self.down
    remove_column :tasaivas, :company_id
  end
end
