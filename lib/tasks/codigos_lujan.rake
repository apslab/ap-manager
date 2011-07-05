namespace :db do
  namespace :aps do
    desc "populated APS Products example to any Company.Use FILE and COMPANY_ID env vars to describe de import"
    task :products_lujan => :environment do
      file = ENV["FILE"] || Rails.root.join('doc/codigos_lujan.csv')
      company_id = ENV["COMPANY_ID"] || Company.first.id
      sh "bundle exec rails runner script/migrate_codigos_lujan.rb #{company_id} #{file}"
    end
  end
end