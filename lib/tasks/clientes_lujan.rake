namespace :db do
  namespace :aps do
    desc "populated APS Customer example to any Company.Use FILE and COMPANY_ID env vars to describe de import"
    task :clientes_lujan => :environment do
      file = ENV["FILE"] || Rails.root.join('doc/clientes_lujan.csv')
      company_id = ENV["COMPANY_ID"] || Company.first.id
      sh "bundle exec rails runner script/migrate_pacientes_lujan.rb #{company_id} #{file}"
    end
  end
end