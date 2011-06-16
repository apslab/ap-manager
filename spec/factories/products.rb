# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :product do |f|
  f.name "MyString"
  f.observation "MyText"
  f.company_id 1
  f.since "2011-06-14"
  f.until "2011-06-14"
  f.tasaiva_id 1
  f.account_id 1
end
