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

Movement.connection.add_index :movements, :detail_account_code
Movement.connection.add_index :movements, :exercise_code

# read the file
CSV.foreach(file_to_migrate,:col_sep => ';') do |row|
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

# print out the number of records
puts "Import Items count: #{Movement.count}"

require 'pp'
require 'irb'
IRB.start