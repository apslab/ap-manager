unless ARGV.size == 2
	$stderr.puts "USAGE: rails runner #{$0} [company id] [path/to/csv/file]"
	exit(1)
end

require 'csv'

company_id = ARGV.first
file_to_migrate = ARGV.last

#CSV.foreach(file_to_migrate,:col_sep => ';') do |row|
CSV.foreach(file_to_migrate) do |row|
	code, name, tutor, direccion,localidad, provincia, codpos, codposx, telefono = row
	puts "retrive code: #{code}, name: #{name} ..."

	puts "creating customer #{name.try(:titlecase)} ..."
	Cliente.create!(:empresa_id => company_id,
	                :codigo => code ,
	                :razonsocial => (name.encode.try(:titlecase)),
	                :direccion => direccion.encode,
	                :telefono => telefono.encode)
	
end