# Cheat sheet

### Generate model
```
$ rails g model Hoge fuga_id:integer foo:float bar:float timestamp:datetime
```

### Migration
```
$ rails g migration AddPartNumberToProducts
$ rake db:migrate
```

### Generate controller
```
# example
rails g controller Hoge
```

### Manual cron
```
# example (local)
$ rails runner Tasks::Hoge.execute
# example (heroku)
$ heroku run rails runner Tasks::Hoge.execute
```

### Create app on Heroku
```
$ heroku create YOUR_APP
```

### Deploy Heroku
```
$ git push heroku master
$ heroku run rake db:migrate
$ heroku open
```

### Test
```
$ rake test
```

### Settings

##### postgresql
```
$ heroku addons:create heroku-postgresql
```

##### update postgresql
```
$ heroku maintenance:on
$ heroku pg:backups capture
$ heroku addons:add heroku-postgresql:hobby-basic
$ heroku pg:wait
$ heroku pg:info
$ heroku pg:copy DATABASE_URL HEROKU_POSTGRESQL_HOGE_URL
$ heroku pg:promote HEROKU_POSTGRESQL_HOGE_URL
$ heroku restart
$ heroku maintenance:off
```

##### redis + sidekiq
```
$ heroku addons:create heroku-redis:hobby-dev
$ heroku addons:add rediscloud
# sidekiq
$ bundle exec rails g task sidekiq
```

```
# sample queue

# sidekiq
class SidekiqSampleJob

  include Sidekiq::Worker

  @queue = :sidekiq_sample_job

  def perform(text)
    path = File.expand_path("log/resque_sample.log", Rails.root)
    File.open(path, 'a') do |f|
      f.puts text
    end

  end
end

# push queue

# sidekiq
Sidekiq::Client.enqueue(SidekiqSampleJob, "execute immediately")
```

```
# config/initializers/sidekiq.rb
if Rails.env.production?

  Sidekiq.configure_client do |config|
    config.redis = { url: ENV['REDIS_URL'], size: 2 }
  end

  Sidekiq.configure_server do |config|
    config.redis = { url: ENV['REDIS_URL'], size: 10 }
  end

end
```

```
# config/puma.rb

# sidekiq
workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
#  ActiveRecord::Base.establish_connection
  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env] || Rails.application.config.database_configuration[Rails.env]
    config['pool'] = ENV['RAILS_MAX_THREADS'] || 5
    ActiveRecord::Base.establish_connection(config)
  end
end
```

```
# Procfile

# sidekiq
web: bundle exec puma -C config/puma.rb
sidekiq: env TERM_CHILD=1 bundle exec sidekiq
```

Run

```
# on localhost
# bundle exec sidekiq
$ redis-server
$ sidekiq
$ rails s

# on Heroku
# sidekiq
$ heroku scale web=1 sidekiq=1
```

##### cron
```
# example (local)
# register
$ whenever --update-crontab
# delete
$ whenever --clear-crontab
$
# example (heroku)
# create scheduler
$ heroku addons:create scheduler:standard
# test scheduler
$ heroku run rake update_feed
# set scheduler
$ heroku addons:open scheduler
```

##### carrierwave
```
$ rails g uploader Image
$ rails g model Image uri:string
```
```rb
# app/models/image.rb

class Image < ActiveRecord::Base
  validates_presence_of :uri
  mount_uploader :uri, ImageUploader
end


# app/uploaders/image_uploader.rb

class ImageUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave
  ...

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
  ...
end
```

##### cloudinary
```
$ heroku addons:create cloudinary:starter
```
```yml
# config/cloudinary.yml

production:
  cloud_name: "hogefuga"
  api_key: "000000000000000"
  api_secret: "aaaaaaaaaaaaaaaaaaaaaaaaaaa"
development:
  cloud_name: "fugahoge"
  api_key: "111111111111111"
  api_secret: "bbbbbbbbbbbbbbbbbbbbbbbbbbb"
```
run local
```
# open URL in local environment

$ CLOUDINARY_URL=*** rails s
```

##### rails_admin
install devise
```
$ rails g devise:install
$ rails g devise user
```
install rails_admin
```
# rails_admin

$ rails g rails_admin:install
```
```rb
# config/initializers/rails_admin.rb
# comment out below

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end 
  config.current_user_method(&:current_user)
```
install cancan
```
# cancan

$ rails g cancan:ability
```
```rb
# app/models/ability.rb

class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.admin?
      can :access, :rails_admin   # grant access to rails_admin
      can :manage, :all           # allow superadmins to do anything
    end 
  end
end
```
```
$ rails g migration AddAdminToUser admin
$ rake db:migrate
```
```slim
# app/views/home/index.html.slim

h1 Home#index

- if user_signed_in?
  |  Logged in as
  strong
    = current_user.email
  | .
  = link_to "Settings", edit_user_registration_path, :class => "navbar-link"
  |  |
  = link_to "Logout", destroy_user_session_path, method: :delete, :class => "navbar-link"
- else
  = link_to "Sign up", new_user_registration_path, :class => 'navbar-link'
  |  |
  = link_to "Login", new_user_session_path, :class => 'navbar-link'

p Find me in app/views/home/index.html.slim
```
```
# local

$ rails c
> user = User.find(1)
> user.update_attribute(:admin, "true")

# heroku

$ heroku run rails c
> user = User.find(1)
> user.update_attribute(:admin, "true")
```
```rb
# config/initializers/rails_admin.rb
# comment out below

  ## == Cancan ==
  config.authorize_with :cancan
```
