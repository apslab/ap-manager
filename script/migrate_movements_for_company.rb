# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

Encoding.default_internal = "UTF-8"
Encoding.default_external = "UTF-8"

require 'iconv'

unless ARGV.size == 2
  $stderr.puts "USAGE: rails runner #{$0} [company id] [path/to/csv/file]"
  exit(1)
end

require 'csv'

company_id = ARGV.first
file_to_migrate = ARGV.last

class Movement < ActiveRecord::Base
  establish_connection :adapter => 'sqlite3', :database => ':memory:'
end

Movement.connection.create_table :movements do |t|
  t.string :detail_account_code, :exercise_code, :detail_description
  t.date :exercise_date_on
  t.decimal :debit, :credit
end

# read the file
CSV.foreach(file_to_migrate,:col_sep => ',', :quote_char => '"', :encoding => 'ISO-8859-1') do |row|
  detail_account_code, exercise_date_on, exercise_code, detail_description, debit_or_credit, detail_amount = row
  
  data = {
    :detail_account_code => detail_account_code, 
    :exercise_date_on => exercise_date_on,
    :exercise_code => exercise_code,
    :detail_description => detail_description
  }

  (debit_or_credit == 'D') ? data.update(:debit => detail_amount) : data.update(:credit => detail_amount)

  # populate the table
  Movement.create(data)
end

# add index
Movement.connection.add_index :movements, :detail_account_code
Movement.connection.add_index :movements, :exercise_code

# print out the number of records
Rails.logger.error("Import Items count: #{Movement.count}")

started_on = Movement.minimum(:exercise_date_on)
finished_on = Movement.maximum(:exercise_date_on)

exercise = Exercise.create!(
              :uneven => true,
              :started_on => started_on,
              :finished_on => finished_on,
              :company_id => company_id,
              :description => "Ejercicio autogenerado #{Time.now.to_i} declarado irregular por ser de migracion"
           )
exercise_codes = Movement.select("DISTINCT(exercise_code)").group(:exercise_code).map(&:exercise_code)

ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')

exercise_codes.each do |exercise_code|
  movements = Movement.find_all_by_exercise_code(exercise_code)
  entry = exercise.entries.build(
              :date_on => movements.first.exercise_date_on,
              :description => "Asiento #{ic.iconv(movements.first.detail_description)} - (autogenerado)"
            )

  movements.each do |movement|
    account = Account.find_by_code(movement.detail_account_code)

    detail_attributes = {
      :description => ic.iconv(movement.detail_description),
      :account_id => account.id
    }

    detail_attributes.update(:debit => movement.debit) unless movement.debit.nil?
    detail_attributes.update(:credit => movement.credit) unless movement.credit.nil?
    
    detail = entry.details.build(detail_attributes)
    entry.details.delete(detail) unless detail.valid?
  end

  unless entry.save
    Rails.logger.error("entry can't be inserted | asiento: #{exercise_code} | #{entry.errors.full_messages.join("\n")}")
  end
end