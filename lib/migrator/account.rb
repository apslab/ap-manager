require 'csv'

module Apslabs

  module Migrator

    class Account

      class << self

        def errors
          @@errors ||= Array.new
        end

        def parsed_lines
          @@parsed_lines ||= 0
        end

        def summary(exercise)
          exercise.reload
          message = <<-EOF
          == Accounts ==
          parsed_lines: #{parsed_lines}
          records: #{exercise.accounts.count}
          errors: #{errors.size}
          EOF

          log.info(message)
          $stderr.puts(message)
        end

        def log
          Rails.logger
        end

        def migrate!(exercise, csv_file)
          @@errors = errors
          CSV.foreach(csv_file) do |row|
            @@parsed_lines = parsed_lines.succ
	          code, name, parent_code = row
	          log.info("retrive code: #{code}, name: #{name}, parent_code: #{parent_code} ...")
	          unless parent_code.blank? || parent_code.to_i.zero?
	            parent_account = exercise.accounts.find_by_code(parent_code)
	            if parent_account.nil?
	              @@errors << "parent error code for #{parent_code} on #{name.try(:titlecase)} account and code #{code}!"
	              log.error(errors.last)
             end
	          end

	          log.info("creating account #{name.try(:titlecase)} ...")
	          account = exercise.accounts.create!(:code => code, :name => (name.encode.try(:titlecase) || code))

	          unless parent_account.nil?
		          log.info("moving account #{account.name.titlecase} to child of #{parent_account.name.try(:titlecase)}...")
		          account.move_to_child_of(parent_account)
	          end
          end

        end

      end

    end

  end

end

