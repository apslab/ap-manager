=begin
Execute:
  heroku console
  load Rails.root.join('db/seeds-cnsp.rb').to_s
=end

cnsp_companies = ['Casa Nuestra Señora del Pilar', 'CNSP Prueba']

cnsp_users = [{
    :email => 'segundoroca@gmail.com',
    :first_name => 'Segundo',
    :last_name => 'Roca'
  },
  {
    :email => 'segundo.roca@hsjd.org',
    :first_name => 'Segundo',
    :last_name => 'Roca'
  }]

cnsp_users.each do |cnsp_user|
  $stderr.puts("create user #{cnsp_user[:email]} with password 123456 and activate...")
  User.create!(:email => cnsp_user[:email],
               :last_name => cnsp_user[:first_name],
               :first_name => cnsp_user[:last_name],
               :password => '123456', 
               :password_confirmation => '123456').confirm!
end

cnsp_companies.each do |cnsp_company|
  $stderr.puts("create example company #{cnsp_company}...")
  Company.create!(:name => cnsp_company, :engines => Rails.application.config.engines)
end

users = User.where(:email => cnsp_users.map{|cnsp_user|cnsp_user[:email]})
Company.where(:name => cnsp_companies).each do |company|
  users.each do |user|
    $stderr.puts("create memberships for #{user.email}...")
    membership = Membership.create!(:company_id => company.id,:role_id => Role.first.id, :user_id => user.id)
    if company.name == cnsp_companies.first
      $stderr.puts("setting membership\'s current company to #{company.name} for #{user.email}...")
      membership.toggle!(:current)  
    end       
  end
end
