class ChangeDetailsFieldsNames < ActiveRecord::Migration
  def self.up
    rename_column(:details, :incoming, :debit)
    rename_column(:details, :outcoming, :credit)
  end

  def self.down
    rename_column(:details, :debit, :incoming)
    rename_column(:details, :credit, :outcoming)
  end
end

