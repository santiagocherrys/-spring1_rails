# config/initializers/oas_rails.rb
OasRails.configure do |config|
  # Set the base URL for your API here.
  config.server_url = Rails.env.production? ? 'https://spring1-rails.onrender.com' : 'http://localhost:3000'
end
