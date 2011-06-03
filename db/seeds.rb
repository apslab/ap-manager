# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

$stderr.puts('create user lmpetek@gmail.com with password 123456 and activate...')
User.create!(:email => 'lmpetek@gmail.com',
             :last_name => 'luis',
             :first_name => 'petek',
             :password => '123456', 
             :password_confirmation => '123456').confirm!

$stderr.puts('create some example companies(Demo, APS, Coca COla, Pepsi)...')
Company.create!(:name => 'Demo', :engines => Rails.application.config.engines)
Company.create!(:name => 'APS', :engines => Rails.application.config.engines - [:odiseo])
Company.create!(:name => 'Coca Cola', :engines => Rails.application.config.engines - [:ares])
Company.create!(:name => 'Pepsi', :engines => Rails.application.config.engines)

$stderr.puts('create role administrator...')
Role.create!(:name => 'administrator')
$stderr.puts('create role operator...')
Role.create!(:name => 'operator')

$stderr.puts('create memberships for lmpetek@gmail.com...')
Company.all.each do |company|
     Membership.create!(:company_id => company.id,:role_id => Role.first.id, :user_id => User.first.id)
end

$stderr.puts('setting membership\'s current company for lmpetek...')
Membership.last.toggle!(:current)