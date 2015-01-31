OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :google_oauth2, '575162953315-phn44fikq4tucmoncsa1nbgkgmi5u0g4.apps.googleusercontent.com', "#{ENV['OAUTH_SECRET']}", {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
  else
    provider :google_oauth2, '575162953315-ckd3bcfo5m1r32kmqlni8j2qejdl81i8.apps.googleusercontent.com', "#{ENV['OAUTH_SECRET_LOCAL']}", {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
  end
    
  provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET']

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
end