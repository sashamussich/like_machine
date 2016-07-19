Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.app_id_facebook,  Rails.application.secrets.app_secret_facebook
end