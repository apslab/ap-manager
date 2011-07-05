class RenameTableComprobantecp < ActiveRecord::Migration
  def self.up
    rename_table :comprobantescp, :compra_comprobantes
  end

  def self.down
    rename_table :compra_comprobantes, :comprobantescp
  end
end
