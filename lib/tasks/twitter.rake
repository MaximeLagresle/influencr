namespace :twitter do
  desc "fetch latest tweets"
  task :fetch => :environment do

    platform_tweet = Platform.find_by name: "Twitter"

    historical_tweets = Medium.where(platform: platform_tweet)
    historical_tweets_list = []
    historical_tweets.each do |tweet|
      historical_tweets_list << tweet.title
    end

    twitter_list = Account.where(platform: platform_tweet)
    twitter_username_list = []
    twitter_list.each do |account|
      twitter_username_list << account.username
    end


    twitter_username_list.each do |username|
      tweets = TwitterClient.user_timeline(username)
      format_tweet = Format.find_by type_of: "tweet"
      influencer = Account.find_by(username: username, platform: platform_tweet)
      tweets.each do |tweet|
        if !historical_tweets_list.include? tweet.id.to_s
          Medium.create! title: tweet.id, content: tweet.full_text, url: tweet.uri, influencer: influencer.influencer, format: format_tweet, platform: platform_tweet
        else
        end
      end
    end
  end
end

