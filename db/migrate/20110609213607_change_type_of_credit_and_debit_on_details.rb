class ChangeTypeOfCreditAndDebitOnDetails < ActiveRecord::Migration
  def self.up
    change_column(:details, :credit, :decimal, :precision => 18, :scale => 2, :default => 0)
    change_column(:details, :debit, :decimal, :precision => 18, :scale => 2, :default => 0)
  end

  def self.down
    change_column(:details, :credit, :decimal)
    change_column(:details, :debit, :decimal)
  end
end
