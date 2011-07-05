class RenameAccountsFieldCompanyId2ExerciseId < ActiveRecord::Migration
  def self.up
    rename_column :accounts, :company_id, :exercise_id
  end

  def self.down
    rename_column :accounts, :exercise_id, :company_id
  end
end

