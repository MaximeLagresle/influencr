#To test this method go on your terminal and run rake twitter:fetch then you can use binding.pry

namespace :twitter do
  desc "fetch latest tweets"
  task :fetch => :environment do

    # Store a Platform Object filtered by name: Twitter
    platform_tweet = Platform.find_by name: "Twitter"

    # Transform an Array of Medium Objects (historical_tweets) into an array of tweet.title strings (historical_tweets_list) => In our case we stored the tweet id under tweet.title
    historical_tweets = Medium.where(platform: platform_tweet)
    historical_tweets_list = []
    historical_tweets.each do |tweet|
      historical_tweets_list << tweet.title
    end

    # Transform an Array of Account Objects (twitter_list) into an array of twitter username strings (twitter_username_list)
    twitter_list = Account.where(platform: platform_tweet)
    twitter_username_list = []
    twitter_list.each do |account|
      twitter_username_list << account.username
    end

    twitter_username_list.each do |username|
      tweets = TwitterClient.user_timeline(username) # check the following link to know more about "user_timeline" : https://www.rubydoc.info/gems/twitter/Twitter/REST/Timelines
      format_tweet = Format.find_by type_of: "tweet"
      influencer = Account.find_by(username: username, platform: platform_tweet)
      tweets.each do |tweet|
        # Make sure that each tweet fetch isn't already in our db (to avoid creating duplicate)
        if !historical_tweets_list.include? tweet.id.to_s
          # If not already in our db then create a new Medium object
          tweet = Medium.create! title: tweet.id, content: tweet.full_text, url: tweet.uri, influencer: influencer.influencer, format: format_tweet, platform: platform_tweet
        end
      end
    end
  end
end

# Gem used: Twitter Ruby Gem
# Doc: https://www.rubydoc.info/gems/twitter/Twitter/REST/
