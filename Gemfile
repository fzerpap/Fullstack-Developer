source 'http://rubygems.org'

ruby '2.5.7'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'

gem 'bootstrap-sass'
#gem 'font-awesome-rails', '4.3.0.0'
gem 'font-awesome-rails'

#Bootstrap-generators provides Twitter Bootstrap generators for Rails with haml
gem 'haml-rails'
gem 'bootstrap-generators', '~> 3.3.4'

# Use postgresql as the database for Active Record
gem 'pg'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'duktape'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.2'

# internationalization
gem 'rails-i18n'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 5'

gem 'jquery-turbolinks'

# devise for authentication
gem 'devise'
# Seguridad añadida a devise
gem 'devise_security_extension'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 2.5'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

#group :doc do
#  # bundle exec rake doc:rails generates the API under doc/api.
#  gem 'sdoc', require: false
#end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#Carga de Imagenes
gem 'carrierwave'
if RUBY_PLATFORM =~ /win32/
  gem 'mini_magick', '~> 4.2.3'
else
  gem 'rmagick', '~> 2.13.4', :platform => :ruby
end


group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'mailcatcher'
  gem 'annotate'
end


group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem "minitest-rails-capybara"
  gem "capybara"
  gem 'rails-controller-testing'

end

gem 'cancancan', '~> 1.10'

gem "jquery-fileupload-rails"


gem 'coffee-script-source', '1.8.0'

#gem 'statsample'

gem 'rails_12factor', group: :production
gem 'puma'

# Dynamic nested forms using jQuery made easy; works with formtastic, simple_form or default forms
gem "cocoon"

gem 'jquery-datatables'

# To group for dates
#gem 'groupdate' 

# For graphics
gem 'apexcharts'

# For import data from excell
#gem 'spreadsheet'
gem 'roo'

# editable tables
#gem "best_in_place"

# Helper for regulars class of ruby
gem 'pundit'







