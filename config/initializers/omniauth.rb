Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, ENV['FB_APP_ID'], ENV['FB_APP_SECRET'], :scope => ENV['FB_SCOPE']
end
