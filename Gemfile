source 'https://rubygems.org'

ruby '2.2.3'

# Bundle edge Rails instead:
# # gem 'rails', github: 'rails/rails'-
gem 'rails', '~> 4.2.0'

# for local
gem 'sqlite3', groups: %w(test development), require: false

# for heroku
gem 'pg', groups: %w(production), require: false

gem 'sass-rails'
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer'

gem 'uglifier'

gem 'settingslogic'

gem 'jquery-rails'
gem 'haml-rails'
gem 'roadie-rails'

gem 'omniauth'
gem 'omniauth-github'
gem 'faraday', '0.8.9' # XXX 0.9.0 has _broken API change. Update as soon as possible...
gem 'mongoid', github: 'DiannaHohensee/mongoid', branch: 'MONGOID-4159' # To use https://github.com/mongodb/mongoid/pull/4179
gem 'octokit', '~> 1.25' # Octokit 2.x couldn't treat response as JSON.

gem 'redis'

group :development do
  gem 'quiet_assets'
  gem 'web-console'
  gem 'tapp', groups: %w(test)
  gem 'letter_opener'
end
gem 'puma', require: false

group :test do
  gem 'rspec-rails', groups: %w(development)
  gem 'rspec-its'
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :production do
  gem 'rails_12factor' # for Heroku
end
