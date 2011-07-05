source 'http://rubygems.org'

gem 'rails', '3.0.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# design
gem 'compass'
gem 'haml-rails'
gem 'jquery-rails'
gem 'cocoon'
gem 'formtastic'
gem 'attrtastic'

# search
gem 'meta_search'

# pdf
gem 'prawn'
gem 'wicked_pdf'

# authentication & authorization
gem 'devise'
gem 'cancan'

# AR Behaviours
gem 'nested_set'
gem 'kaminari'

# engines desde git
gem 'odiseo', :git => 'git://github.com/apslab/odiseo-engine.git'
gem 'ares', :git => 'git://github.com/apslab/ares-engine.git'
gem 'hefesto', :git => 'git://github.com/apslab/hefesto-engine.git'
#gem 'apolo', :git => 'git://github.com/apslab/apolo-engine.git'


# engines locales
#gem 'odiseo', :path => '../'
#gem 'ares', :path => '../'
#gem 'hefesto', :path => '../'
#gem 'apolo', :path => '../'


# database to development & migrations
gem 'sqlite3'

group :development, :test do
  # design depends
  gem 'hpricot'
  gem 'ruby_parser'
  # documentation
  gem 'annotate'
  # testing
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :production do
  # heroku's cache
  gem 'dalli'
end

