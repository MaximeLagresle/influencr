TwitterClient = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["API_KEY"]
  config.consumer_secret     = ENV["API_SECRET_KEY"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end
