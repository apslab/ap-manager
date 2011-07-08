#encoding: utf-8
=begin
Execute:
  heroku console
  load Rails.root.join('db/seeds-aps.rb').to_s
=end
Country.create!(:code => 'AR', :name => 'Argentina')

ar_country_id = Country.where(:code => 'AR').first.id
ar_provincies = [{:code => 'AR01',:name => 'Buenos Aires',:country_id => ar_country_id},
  {:code => 'AR02',:name => 'Catamarca',:country_id => ar_country_id},
  {:code => 'AR03',:name => 'Chaco',:country_id => ar_country_id},
  {:code => 'AR04',:name => 'Chubut',:country_id => ar_country_id},
  {:code => 'AR05',:name => 'Cordoba',:country_id => ar_country_id},
  {:code => 'AR06',:name => 'Corrientes',:country_id => ar_country_id},
  {:code => 'AR07',:name => 'Distrito Federal',:country_id => ar_country_id},
  {:code => 'AR08',:name => 'Entre Rios',:country_id => ar_country_id},
  {:code => 'AR09',:name => 'Formosa',:country_id => ar_country_id},
  {:code => 'AR10',:name => 'Jujuy',:country_id => ar_country_id},
  {:code => 'AR11',:name => 'La Pampa',:country_id => ar_country_id},
  {:code => 'AR12',:name => 'La Rioja',:country_id => ar_country_id},
  {:code => 'AR13',:name => 'Medoza',:country_id => ar_country_id},
  {:code => 'AR14',:name => 'Misiones',:country_id => ar_country_id},
  {:code => 'AR15',:name => 'Neuquen',:country_id => ar_country_id},
  {:code => 'AR16',:name => 'Rio Negro',:country_id => ar_country_id},
  {:code => 'AR17',:name => 'Salta',:country_id => ar_country_id},
  {:code => 'AR18',:name => 'San Juan',:country_id => ar_country_id},
  {:code => 'AR19',:name => 'San Luis',:country_id => ar_country_id},
  {:code => 'AR20',:name => 'Santa Cruz',:country_id => ar_country_id},
  {:code => 'AR21',:name => 'Santa Fe',:country_id => ar_country_id},
  {:code => 'AR22',:name => 'Santiago del Estero',:country_id => ar_country_id},
  {:code => 'AR23',:name => 'Tierra del Fuego, Antartida e Islas del Atlantico',:country_id => ar_country_id},
  {:code => 'AR24',:name => 'Tucuman',:country_id => ar_country_id}]

ar_provincies.each do |province|
  $stderr.puts("create province #{province[:name]}...")
  Province.create!(:code => province[:code],
               :name => province[:name],
               :country_id => province[:country_id])
end