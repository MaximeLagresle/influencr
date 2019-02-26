puts 'Cleaning database'
Platform.destroy_all
Format.destroy_all
Influencer.destroy_all
Account.destroy_all
Medium.destroy_all
State.destroy_all
User.destroy_all

puts 'Creating platforms list'
platforms_list = [
  {name: "Twitter", weight: 1.0},
  {name: "Blog", weight: 1.0}
]
platforms_list.each {|platform| Platform.create!(name: platform[:name], weight: platform[:weight])}

puts 'Creating formats list'
formats_list = [
  {type_of: "article", weight: 1.0},
  {type_of: "tweet", weight: 0.25}
]
formats_list.each {|format_type| Format.create!(type_of: format_type[:type_of], weight: format_type[:weight])}

puts 'Creating influencers list'
influencers_list = [
  {name: "Paul Graham", bio: "Programmer, writer, and investor. In 1995, he and Robert Morris started Viaweb, the first software as a service company. Viaweb was acquired by Yahoo in 1998, where it became Yahoo Store. In 2001 he started publishing essays on paulgraham.com, which in 2015 got 34 million page views. In 2005 he and Jessica Livingston, Robert Morris, and Trevor Blackwell started Y Combinator, the first of a new type of startup incubator. Since 2005 Y Combinator has funded over 1000 startups, including Dropbox, Airbnb, Stripe, and Reddit."}
]
influencers_list.each {|influencer| Influencer.create!(name: influencer[:name], bio: influencer[:bio])}

puts 'Creating accounts list'
twitter = Platform.find_by name: "Twitter"
blog = Platform.find_by name: "Blog"
influencer = Influencer.find_by name: "Paul Graham"
accounts_list = [
  {username: "paulg", url:"https://twitter.com/paulg", platform: twitter, influencer: influencer},
  {username: nil, url:"http://paulgraham.com/", platform: blog, influencer: influencer}
]
accounts_list.each {|account| Account.create!(username: account[:username], url: account[:url], platform: account[:platform], influencer: account[:influencer])}

puts 'Creating media list'
article = Format.find_by type_of: "article"
tweet = Format.find_by type_of: "tweet"
media_list = [
  {url: "http://paulgraham.com/sun.html", content: "The most valuable insights are both general and surprising. F = ma for example. But general and surprising is a hard combination to achieve. That territory tends to be picked clean, precisely because those insights are so valuable.\n
Ordinarily, the best that people can do is one without the other: either surprising without being general (e.g. gossip), or general without being surprising (e.g. platitudes).\n
Where things get interesting is the moderately valuable insights. You get those from small additions of whichever quality was missing. The more common case is a small addition of generality: a piece of gossip that's more than just gossip, because it teaches something interesting about the world. But another less common approach is to focus on the most general ideas and see if you can find something new to say about them. Because these start out so general, you only need a small delta of novelty to produce a useful insight.\n
A small delta of novelty is all you'll be able to get most of the time. Which means if you take this route, your ideas will seem a lot like ones that already exist. Sometimes you'll find you've merely rediscovered an idea that did already exist. But don't be discouraged. Remember the huge multiplier that kicks in when you do manage to think of something even a little new.\n
Corollary: the more general the ideas you're talking about, the less you should worry about repeating yourself. If you write enough, it's inevitable you will. Your brain is much the same from year to year and so are the stimuli that hit it. I feel slightly bad when I find I've said something close to what I've said before, as if I were plagiarizing myself. But rationally one shouldn't. You won't say something exactly the same way the second time, and that variation increases the chance you'll get that tiny but critical delta of novelty.\n
And of course, ideas beget ideas. (That sounds familiar.) An idea with a small amount of novelty could lead to one with more. But only if you keep going. So it's doubly important not to let yourself be discouraged by people who say there's not much new about something you've discovered. 'Not much new' is a real achievement when you're talking about the most general ideas.\n
It's not true that there's nothing new under the sun. There are some domains where there's almost nothing new. But there's a big difference between nothing and almost nothing, when it's multiplied by the area under the sun.", title: "General and Surprising", influencer: influencer, format: article, platform: blog},
  {url: "https://twitter.com/paulg/status/1099648921180217345", content: nil, title: nil, influencer: influencer, format: tweet, platform: blog}
]
media_list.each {|medium| Medium.create!(url: medium[:url], content: medium[:content], title: medium[:title], influencer: medium[:influencer], format: medium[:format], platform: medium[:platform])}

puts 'Creating states list'
states_list = []

