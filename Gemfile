source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '5.0.1'                                            # rails
gem 'listen'
gem 'puma'                                                      # server
gem 'active_hash'                                               # model
gem 'sidekiq'                                                   # async
gem 'uglifier'
gem 'turbolinks'
gem 'jbuilder'                                                  # json
gem 'sdoc'
gem 'whenever', :require => false                               # cron
gem 'faraday'                                                   # http client
gem 'devise'                                                    # authentication
gem 'cancan'                                                    # authentication
gem 'rails_admin'                                               # admin
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'    # uploader
gem 'cloudinary'                                                # image-storage
gem 'rack-timeout'
gem 'scout_apm'                                                 # monitoring

# front-end
gem 'sass-rails'
gem 'slim-rails'

group :development do
  gem 'web-console'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'spring'
  gem 'heroku'
end

group :test do
  # test
  gem 'autodoc'
  gem 'redcarpet'
  gem 'minitest-rails-capybara'
  gem 'minitest-spec-rails'
  gem 'minitest-doc_reporter'
  gem 'minitest-stub_any_instance'
  gem 'minitest-bang'
  gem 'minitest-line'
  gem 'factory_girl_rails'
end

group :production do
  # postgresql
  gem 'pg'
  gem 'activerecord-postgresql-adapter'
end
