source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '~> 5.0.4'                                         # rails
gem 'puma', '~> 3.0'                                            # server
gem 'active_hash'                                               # model
gem 'sidekiq'                                                   # async
gem 'uglifier'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'                                        # json builder
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
gem 'sass-rails', '~> 5.0'                                      # css
gem 'slim-rails'                                                # html

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'heroku'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platform: :mri
end

group :production do
  # postgresql
  gem 'pg'
  gem 'activerecord-postgresql-adapter'
end
