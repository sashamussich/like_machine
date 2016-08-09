Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["APP_ID_FB"], ENV["APP_SECRET_FB"]
end
