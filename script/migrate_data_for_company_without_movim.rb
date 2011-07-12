# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

require 'migrator/account'
require 'migrator/movement'

Encoding.default_internal = "UTF-8"
Encoding.default_external = "UTF-8"

unless ARGV.size == 2
  $stderr.puts '== Companies =='
  Company.all.each do |company|
    $stderr.puts "Company #{company.name} => #{company.id}"
  end

  $stderr.puts '-' * 40
  $stderr.puts "USAGE: rails runner #{$0} [company_id] [cvs_for_accounts]"
  exit(1)
end

company_id, cvs_for_accounts = ARGV

# open transaction
ActiveRecord::Base.transaction do
  begin

    # populate movements data
    # Apslabs::Migrator::Model.setup!(cvs_for_movements)

    # find or create exercise
    exercise = Exercise.find_or_create_by_company_id_and_started_on_and_finished_on(
                 :uneven => true,
                 :description => "Ejercicio autogenerado #{Time.now.to_i} declarado irregular por ser de migracion",
                 :started_on => Date.today - 5,
                 :finished_on => Date.today,
                 :company_id => company_id
               )

    Apslabs::Migrator::Account.migrate!(exercise, cvs_for_accounts)
    Apslabs::Migrator::Movement.migrate!(exercise)

    Apslabs::Migrator::Movement.summary(exercise)
    Apslabs::Migrator::Account.summary(exercise)
  rescue
    # capture message exception
    exp = $!
    begin
      # rolback transaction
      raise ActiveRecord::Rollback
    rescue
    end
    # raise original exception message
    raise exp
  end
end

