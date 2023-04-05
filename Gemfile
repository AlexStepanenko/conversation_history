source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '7.0.4.3'

gem 'sprockets-rails'
gem 'pg', '~> 1.4'
gem 'puma', '~> 5.5'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'bootsnap', require: false
gem 'pundit', '~> 2.3'
gem 'faker', '~> 3.1'
gem 'factory_bot_rails', '~> 6.2'
gem 'kaminari', '~> 1.2'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'bullet', '~> 7.0'
  gem 'pry'
  gem 'rspec-rails', '~> 6.0'
end

group :development do
  gem 'rubycritic', '~> 4.7'
  gem 'rubocop'
end

group :test do
  gem 'shoulda-matchers', '~> 5.3'
end
