# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.create!(:email => 'lmpetek@gmail.com',
             :last_name => 'luis',
             :first_name => 'petek',
             :password => '123456', 
             :password_confirmation => '123456').confirm!

Company.create!(:name => 'Demo')
Company.create!(:name => 'APS')
Company.create!(:name => 'Coca Cola')
Company.create!(:name => 'Pepsi')

Role.create!(:name => 'administrator')
Role.create!(:name => 'operator')

Company.all.each do |company|
     Membership.create!(:company_id => company.id,:role_id => Role.first.id, :user_id => User.first.id)
end
Membership.first.toggle!(:current)