namespace :db do
  namespace :aps do

    desc "populated APS Accounts and Movements data to any Company.Use COMPANY_ID, MOVEMENTS_FILE and ACCOUNTS_FILE env vars to describe de import"
    task :populate_data => :environment do
      company_id = ENV["COMPANY_ID"] || Company.first.id
      cvs_for_movements = ENV["MOVEMENTS_FILE"]
      cvs_for_accounts = ENV["ACCOUNTS_FILE"]

      sh "bundle exec rails runner script/migrate_data_for_company.rb #{company_id} #{cvs_for_movements} #{cvs_for_accounts}"
    end

  end
end