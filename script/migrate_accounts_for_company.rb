unless ARGV.size == 2
	$stderr.puts "USAGE: rails runner #{$0} [company id] [path/to/csv/file]"
	exit(1)
end

require 'csv'

company_id = ARGV.first
file_to_migrate = ARGV.last

#CSV.foreach(file_to_migrate,:col_sep => ';') do |row|
CSV.foreach(file_to_migrate) do |row|
	code, name, parent_code = row
	unless parent_code.blank? || parent_code.to_i.zero?
	  parent_account = Account.scoped_by_company_id(company_id).find_by_code(parent_code)
	  $stderr.puts "ERROR: parent error code for #{parent_code} on #{name.try(:titlecase)} account and code #{code}!" if parent_account.nil?
	end

	$stderr.puts "creating account #{name.try(:titlecase)} ..."
	account = Account.create(:company_id => company_id, :code => code, :name => (name.encode.try(:titlecase) || code))
	
	unless parent_account.nil?
		$stderr.puts "moving account #{account.name.titlecase} to child of #{parent_account.name.try(:titlecase)}..."
		account.move_to_child_of(parent_account) 
	end
end