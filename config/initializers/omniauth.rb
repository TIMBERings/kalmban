OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '575162953315-phn44fikq4tucmoncsa1nbgkgmi5u0g4.apps.googleusercontent.com', "#{ENV['OAUTH_SECRET']}", {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end