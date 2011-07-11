#encoding: utf-8
=begin
Execute:
  heroku console
  load Rails.root.join('db/seeds-aps.rb').to_s
=end

aps_companies = ['CIPBA srl', 'Porres Prueba']

aps_users = [{:email => 'dek@fibertel.com.ar',
    :first_name => 'Ezequiel',
    :last_name => 'Apellido'},
    {:email => 'soporte@ap-sys.com.ar',
        :first_name => 'soporte',
        :last_name => 'aps' }]

aps_users.each do |aps_user|
  $stderr.puts("create user #{aps_user[:email]} with password 123456 and activate...")
  User.create!(:email => aps_user[:email],
               :last_name => aps_user[:first_name],
               :first_name => aps_user[:last_name],
               :password => '123456', 
               :password_confirmation => '123456').confirm!
end

aps_companies.each do |aps_company|
  $stderr.puts("create example company #{aps_company}...")
  Company.create!(:name => aps_company, :engines => [Odiseo])
end

users = User.where(:email => aps_users.map{|aps_user|aps_user[:email]})
Company.where(:name => aps_companies).each do |company|
  users.each do |user|
    $stderr.puts("create memberships for #{user.email}...")
    membership = Membership.create!(:company_id => company.id,:role_id => Role.first.id, :user_id => user.id)
    if company.name == aps_companies.first
      $stderr.puts("setting membership\'s current company to #{company.name} for #{user.email}...")
      membership.toggle!(:current)  
    end       
  end
end