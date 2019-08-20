source 'https://rubygems.org'

gem 'rails', '3.2.22.5'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# https://rvm.io/integration/capistrano/
gem 'capistrano'
gem 'rvm-capistrano'

# To use debugger
# gem 'debugger'

# Interface gráfica: http://rubygems.org/gems/haml-rails
gem 'haml'
gem 'haml-rails', :group => :development

gem "rspec-rails",  :group => [:test]
gem "capybara",  :group => [:test]

# annotate, adicionar descrição das tabelas nos modelos
gem 'annotate', :group => :development 
# bundle exec erd | https://github.com/voormedia/rails-erd/
gem 'rails-erd' , :group => :development

gem 'devise'
gem 'devise-i18n'
gem 'cancan'
# https://github.com/EppO/rolify/wiki/Tutorial
gem 'rolify'

group :test do
  # teste de aceitação
  # http://collectiveidea.com/blog/archives/2010/09/07/practical-cucumber/
  gem "cucumber-rails", :require => false # http://stackoverflow.com/questions/9781456/cucumber-rails-required-outside-of-env-rb-the-rest-of-loading-is-being-defered
  gem 'database_cleaner'
  gem 'capybara'
  gem "factory_girl_rails", "~> 4.0" # https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
end


group :production do
  gem 'pg'
end

# Deploy with Capistrano
group :development do
  gem 'pg'
end

# Possibilitar uploads, carrierwave ou paperclip: https://github.com/jnicklas/carrierwave
gem "carrierwave"

