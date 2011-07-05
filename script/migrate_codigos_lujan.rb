unless ARGV.size == 2
	$stderr.puts "USAGE: rails runner #{$0} [company id] [path/to/csv/file]"
	exit(1)
end

require 'csv'

company_id = ARGV.first
file_to_migrate = ARGV.last

#CSV.foreach(file_to_migrate,:col_sep => ';') do |row|
CSV.foreach(file_to_migrate) do |row|
	nada, code, name, price, nada1, nada2, nada3 = row
	puts "retrive code: #{code}, name: #{name} ..."

	puts "creating customer #{name.try(:titlecase)} ..."
	Product.create!(:company_id => company_id,
	                :code => code ,
	                :name => (name.encode.try(:titlecase)),
	                :price => price.to_f,
	                :since => Date.today) unless name.blank?
end