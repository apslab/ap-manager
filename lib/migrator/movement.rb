require 'iconv'
require 'csv'

module Apslabs

  module Migrator
    module Model

      class Movement < ActiveRecord::Base
        establish_connection :adapter => 'sqlite3', :database => ':memory:'
      end

      class << self

        def log
          Rails.logger
        end

        def create_schema!
          Movement.connection.create_table :movements do |t|
            t.string :detail_account_code, :exercise_code, :detail_description
            t.date :exercise_date_on
            t.decimal :debit, :credit
          end
        end

        def create_index!
          Movement.connection.add_index :movements, :detail_account_code
          Movement.connection.add_index :movements, :exercise_code
        end

        def seed!(cvs_file)
          CSV.foreach(cvs_file,:col_sep => ',', :quote_char => '"', :encoding => 'ISO-8859-1') do |row|
            Apslabs::Migrator::Movement.parsed_lines = Apslabs::Migrator::Movement.parsed_lines.succ
            detail_account_code, exercise_date_on, exercise_code, detail_description, debit_or_credit, detail_amount = row

            data = {
              :detail_account_code => detail_account_code,
              :exercise_date_on => exercise_date_on,
              :exercise_code => exercise_code,
              :detail_description => detail_description
            }

            (debit_or_credit == 'D') ? data.update(:debit => detail_amount) : data.update(:credit => detail_amount)

            # populate the table
            Movement.create!(data)
          end

          log.info("load #{Model::Movement.count} movements to migrate...")
        end

        def setup!(cvs_file)
          Model.create_schema!
          Model.seed!(cvs_file)
          Model.create_index!
        end

      end

    end

    class Movement

      class << self

        def parsed_lines
          @@parsed_lines ||= 0
        end

        def parsed_lines=(value)
          @@parsed_lines = value
        end

        def summary(exercise)
          exercise.reload

          message = <<-EOF
          == Movements ==
          parsed lines: #{parsed_lines}
          load records: #{Model::Movement.count}
          entries records: #{exercise.entries.count}
          details records: #{exercise.accounts.map(&:details).flatten.size}
          EOF

          log.info(message)
          $stderr.puts(message)
        end

        def log
          Rails.logger
        end

        def migrate!(exercise)
          ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')

          # for each old entry
          exercise_codes.each do |exercise_code|
            # get all old details for an old entry
            movements = Model::Movement.find_all_by_exercise_code(exercise_code)
            # build new entry
            entry = exercise.entries.build(
                      :date_on => movements.first.exercise_date_on,
                      :description => "Asiento #{ic.iconv(movements.first.detail_description)} - (autogenerado)"
            )
            # for each old details on this old entry
            movements.each do |movement|
              # get account for this old details
              account = exercise.accounts.find_by_code(movement.detail_account_code)

              detail_attributes = {
                :description => ic.iconv(movement.detail_description),
                :account_id => account.id
              }

              detail_attributes.update(:debit => movement.debit) unless movement.debit.nil?
              detail_attributes.update(:credit => movement.credit) unless movement.credit.nil?

              detail = entry.details.build(detail_attributes)
              entry.details.delete(detail) unless detail.valid?

              log.error("entry can't be inserted | asiento: #{exercise_code} | #{entry.errors.full_messages.join("\n")}") unless entry.save
            end

          end

        end

        def exercise_codes
          Model::Movement.select("DISTINCT(exercise_code)").group(:exercise_code).map(&:exercise_code)
        end

      end

    end

  end

end

