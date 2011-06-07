namespace :db do
  namespace :aps do
    desc "populated APS Accounts example to any Company.Use FILE and COMPANY_ID env vars to describe de import"
    task :populate_accounts => :environment do
      file = ENV["FILE"] || Rails.root.join('doc/MAECO.csv')
      company_id = ENV["COMPANY_ID"] || Company.first.id
      sh "bundle exec rails runner script/migrate_accounts_for_company.rb #{company_id} #{file}"
    end
  end
end