=begin
Execute:
  heroku console
  load Rails.root.join('db/seeds-maranon.rb').to_s
=end

maranon_companies = ['Maranon', 'Maranon Prueba']

maranon_users = [{
    :email => 'natibergna@hotmail.com',
    :first_name => 'Natalia',
    :last_name => 'Bergna'
  }]

maranon_users.each do |maranon_user|
  $stderr.puts("create user #{maranon_user[:email]} with password 123456 and activate...")
  User.create!(:email => maranon_user[:email],
               :last_name => maranon_user[:first_name],
               :first_name => maranon_user[:last_name],
               :password => '123456', 
               :password_confirmation => '123456').confirm!
end

=begin
maranon_companies.each do |maranon_company|
  $stderr.puts("create example company #{maranon_company}...")
  Company.create!(:name => maranon_company, :engines => Rails.application.config.engines)
end
=end

users = User.where(:email => maranon_users.map{|maranon_user|maranon_user[:email]})
Company.where(:name => maranon_companies).each do |company|
  users.each do |user|
    $stderr.puts("create memberships for #{user.email}...")
    membership = Membership.create!(:company_id => company.id,:role_id => Role.first.id, :user_id => user.id)
    if company.name == maranon_companies.first
      $stderr.puts("setting membership\'s current company to #{company.name} for #{user.email}...")
      membership.toggle!(:current)  
    end       
  end
end
