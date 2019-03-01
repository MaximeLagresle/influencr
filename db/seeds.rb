# Initialize by cleaning the DB

puts 'Cleaning database'
Platform.destroy_all
Format.destroy_all
Influencer.destroy_all
Account.destroy_all
Medium.destroy_all
State.destroy_all
User.destroy_all

# Creating the 4 types of platforms
twitter = Platform.create! name: "Twitter", weight: 1.0
blog = Platform.create! name: "Blog", weight: 1.0
newsletter = Platform.create! name: "Newsletter", weight: 1.0
medium = Platform.create! name: "Medium", weight: 1.0
external_blog = Platform.create! name: "External Blog", weight: 1.0
youtube = Platform.create! name:"Conference", weight: 1.0

# Creating the 4 types of formats
tweet = Format.create! type_of: "tweet", weight: 0.25
article = Format.create! type_of: "article", weight: 1.0
podcast = Format.create! type_of: "podcast", weight: 1.0
video = Format.create! type_of: "video", weight: 1.0


# Creating big m hash!
puts 'Creating database'
full_list = [

  # Influencer 1 : Paul Graham

  {
    name: 'Paul Graham',
    bio: "Programmer, writer, and investor. In 1995, he and Robert Morris started Viaweb, the first software as a service company. Viaweb was acquired by Yahoo in 1998, where it became Yahoo Store. In 2001 he started publishing essays on paulgraham.com, which in 2015 got 34 million page views. In 2005 he and Jessica Livingston, Robert Morris, and Trevor Blackwell started Y Combinator, the first of a new type of startup incubator. Since 2005 Y Combinator has funded over 1000 startups, including Dropbox, Airbnb, Stripe, and Reddit.",
    accounts: [
      {
        username: "paulg",
        url:"https://twitter.com/paulg",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"http://paulgraham.com/",
        platform: blog,
        media: [
          {
            url: "http://paulgraham.com/sun.html",
            content: "The most valuable insights are both general and surprising. F = ma for example. But general and surprising is a hard combination to achieve. That territory tends to be picked clean, precisely because those insights are so valuable.\n
Ordinarily, the best that people can do is one without the other: either surprising without being general (e.g. gossip), or general without being surprising (e.g. platitudes).\n
Where things get interesting is the moderately valuable insights. You get those from small additions of whichever quality was missing. The more common case is a small addition of generality: a piece of gossip that's more than just gossip, because it teaches something interesting about the world. But another less common approach is to focus on the most general ideas and see if you can find something new to say about them. Because these start out so general, you only need a small delta of novelty to produce a useful insight.\n
A small delta of novelty is all you'll be able to get most of the time. Which means if you take this route, your ideas will seem a lot like ones that already exist. Sometimes you'll find you've merely rediscovered an idea that did already exist. But don't be discouraged. Remember the huge multiplier that kicks in when you do manage to think of something even a little new.\n
Corollary: the more general the ideas you're talking about, the less you should worry about repeating yourself. If you write enough, it's inevitable you will. Your brain is much the same from year to year and so are the stimuli that hit it. I feel slightly bad when I find I've said something close to what I've said before, as if I were plagiarizing myself. But rationally one shouldn't. You won't say something exactly the same way the second time, and that variation increases the chance you'll get that tiny but critical delta of novelty.\n
And of course, ideas beget ideas. (That sounds familiar.) An idea with a small amount of novelty could lead to one with more. But only if you keep going. So it's doubly important not to let yourself be discouraged by people who say there's not much new about something you've discovered. 'Not much new' is a real achievement when you're talking about the most general ideas.\n
It's not true that there's nothing new under the sun. There are some domains where there's almost nothing new. But there's a big difference between nothing and almost nothing, when it's multiplied by the area under the sun.",
            title: "General and Surprising",
            header: "The most valuable insights are both general and surprising. F = ma for example. But general and surprising is a hard combination to achieve.",
            format: article
          }
        ]
      }
    ]
  },

  # Influencer 2 : James Currier

  {
    name: 'James Currier',
    bio: "James is one of Silicon Valley’s foremost experts in growth and network effects. He's a four-time serial entrepreneur. He is also a pioneer of user-generated models, viral marketing, a/b testing, crowdsourcing, and myriad other growth techniques now followed by nearly all technology companies.",
    accounts: [
      {
        username: "jamescurrier",
        url:"https://twitter.com/jamescurrier",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"https://www.nfx.com/essays",
        platform: blog,
        media: [
          {
            url: "https://www.nfx.com/post/network-effects-alive-and-thriving",
            content: "Recently, my friend Sarah Lacy at Pando.com wrote yet another insightful thought piece about the state of venture investing and the startup world.  But this one emerged with an unfortunate title:\n “The death of network effects and the sad return of the VC kingmaker”\n The original idea for the article came from a conversation she and I had in October, which has nothing to do with network effects.  My point was that raising capital was becoming more important to success, not less, and thus VC’s are becoming kingmakers again. Thus, this article generously quotes me.\n Unfortunately, based on the title, several people have thought that I am now saying network effects are dead, despite being a Partner at a fund whose name is Network Effects Guild (NFX Guild).\n It would indeed be an irony if true, but nothing could be further from the truth.\n More than ever, we believe getting network effects are critical to building value in startups.  I believe this will be true for the rest of my lifetime.  So much so that my Partners and I spend many hours per week honing our skills at helping build network effects in our 65+ portfolio companies.\nNetwork effects are alive and thriving.  The most valuable companies have them, and the most valuable companies in the future will have them.\n – James",
            title: "Network Effects Are Not Dead, They Are Alive and Thriving",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://www.iangels.co/blog/",
        platform: external_blog,
        media: [
          {
            url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/274053817&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            content: nil,
            title: "Podcast: Network Effects with James Currier",
            header: "60% of the value created by tech companies since 1994 have 'network effects' at their core. In this podcast, entrepreneur, angel investor, and co-founder of the NFX Guild James Currier joins iAngels' host Max Marine to help define network effects and their implications for early-stage investors.",
            format: podcast
          }
        ]
      },
      {
        username: nil,
        url:"https://www.youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=RGWG3_vfxiQ",
            content: nil,
            title: "Solving the Chicken or Egg Problem",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: video
          }
        ]
      }
    ]
  },

  # Influencer 3 : Brian Balfour

  {
    name: 'Brian Balfour',
    bio: "Founder/CEO of Reforge, previously VP Growth @ HubSpot. Brian Balfour has started multiple VC backed companies, and grown user bases to millions of daily active users. He writes detailed essays on growth and user acquisition that have been featured in Forbes, Hacker Monthly, and OnStartups to help build a growth machine.",
    accounts: [
      {
        username: "bbalfour",
        url:"https://twitter.com/bbalfour",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"https://brianbalfour.com/",
        platform: blog,
        media: [
          {
            url: "https://brianbalfour.com/essays/how-to-launch-a-product-or-feature-to-maximize-growth",
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            title: "How To Launch A Product or Feature To Maximize Growth",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://www.intercom.com/blog/",
        platform: external_blog,
        media: [
          {
            url: "https://art19.com/shows/inside-intercom/episodes/d207c7c8-3869-41b2-a5b8-40313ac29a93/embed",
            content: nil,
            title: "Brian Balfour on creating meaningful growth",
            header: "As VP of Growth at HubSpot, Brian oversees the growth teams for new products such as Sidekick and HubSpot CRM. You may also recognize his byline for articles about growth strategy, user acquisition, process, and teams from his popular blog, Coelevate.",
            format: podcast
          }
        ]
      },
      {
        username: nil,
        url:"https://www.youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=RGWG3_vfxiQ",
            content: nil,
            title: "Brian Balfour: Building a Growth Machine",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: video
          }
        ]
      }
    ]
  },

  # Influencer 4 : Andrew Chen

  {
    name: 'Andrew Chen',
    bio: "Investor at Andreessen Horowitz, where he focuses on consumer products, marketplaces, and bottoms up SaaS. Previously, he led growth teams at Uber.",
    accounts: [
      {
        username: "andrewchen",
        url:"https://twitter.com/andrewchen",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"https://andrewchen.co/",
        platform: blog,
        media: [
          {
            url: "https://andrewchen.co/2018-essay-collection/",
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            title: "2018 essay collection on growth metrics, marketplaces, viral growth in the enterprise, and more",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",,
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://andrewchen.co/",
        platform: blog,
        media: [
          {
            url: "https://soundcloud.com/a16z/growth-user-acquisition",
            content: "<iframe width='100%' height='300' scrolling='no' frameborder='no' allow='autoplay' src='https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/483117867&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true'><\/iframe>",
            title: "The Basics of Growth 1 -- User Acquisition",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: podcast
          }
        ]
      },
      {
        username: nil,
        url:"https://www.youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=m8DQpqJwo3Q",
            content: nil,
            title: "Chat with Andrew Chen, Supply Growth at Uber",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: video
          }
        ]
      }
    ]
  },

  # Influencer 5 : Connie Chan

  {
    name: 'Connie Chan',
    bio: "Connie Chan is a general partner at Andreessen Horowitz where she focuses on consumer tech investments. Since joining the firm in 2011, Connie has worked on the investment team sourcing consumer tech deals including Pinterest and Lime and worked closely with startups across the portfolio.",
    accounts: [
      {
        username: "conniechan",
        url:"https://twitter.com/conniechan",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"http://www.conniechan.com/",
        platform: blog,
        media: [
          {
            url: "https://a16z.com/2018/12/07/when-advertising-isnt-enough-multimodal-business-models-product-strategy/",
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            title: "Outgrowing Advertising: Multimodal Business Models as a Product Strategy",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"http://www.conniechan.com/#posts-and-podcasts",
        platform: blog,
        media: [
          {
            url: "https://soundcloud.com/a16z/mobile-design-culture-product",
            content: nil,
            title: "Culture and/of Design",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: podcast
          }
        ]
      }
    ]
  },

  # Influencer 6 : Marc Andreessen

  {
    name: 'Marc Andreessen',
    bio: "Marc Andreessen is a cofounder and general partner of the venture capital firm Andreessen Horowitz. He is an innovator and creator, one of the few to pioneer a software category used by more than a billion people and one of the few to establish multiple billion-dollar companies. \n
    Marc co-created the highly influential Mosaic Internet browser and co-founded Netscape, which later sold to AOL for $4.2 billion. He also co-founded Loudcloud, which as Opsware, sold to Hewlett-Packard for $1.6 billion. He later served on the board of Hewlett-Packard from 2008 to 2018.",
    accounts: [
      {
        username: nil,
        url:"http://blog.pmarca.com/",
        platform: blog,
        media: []
      },
      {
        username: nil,
        url:"https://a16z.com/2018/",
        platform: external_blog,
        media: [
          {
            url: "https://soundcloud.com/a16z/talent-tech-trends-culture-ben-marc-tyler-cowen-summit-2018",
            content: nil,
            title: "Talent, Tech Trends, and Culture",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: podcast
          }
        ]
      }
    ]
  },

  # Influencer 7 : Sam Altman

  {
    name: 'Sam Altman',
    bio: "Sam Altman is an American entrepreneur, investor, programmer, and blogger. He is the president of Y Combinator and co-chairman of OpenAI.",
    accounts: [
      {
        username: "sama",
        url:"https://twitter.com/sama",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"https://blog.samaltman.com/",
        platform: blog,
        media: [
          {
            url: "https://blog.samaltman.com/how-to-be-successful",
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            title: "How To Be Successful",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://mastersofscale.com/",
        platform: external_blog,
        media: [
          {
            url: "https://rss.art19.com/episodes/85928af6-62aa-4d53-ac55-0c3300241767.mp3",
            content: nil,
            title: "Why customer love is all you need",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: podcast
          }
        ]
      },
      {
        username: nil,
        url:"https://www.youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=0lJKucu6HJc",
            content: nil,
            title: "How to Succeed with a Startup",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: video
          }
        ]
      }
    ]
  },

  # Influencer 8 : Benedict Evans

  {
    name: 'Benedict Evans',
    bio: "I work at Andreessen Horowitz ('a16z'), a venture capital firm in Silicon Valley that invests in technology companies. I try to work out what's going on and what will happen next.",
    accounts: [
      {
        username: "benedictevans",
        url:"https://twitter.com/benedictevans",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"https://www.ben-evans.com/benedictevans/",
        platform: blog,
        media: [
          {
            url: "https://www.ben-evans.com/benedictevans/2019/2/5/cameras-that-understand",
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            title: "Cameras that understand: portrait mode and Google Lens",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://www.ben-evans.com/benedictevans/",
        platform:blog,
        media: [
          {
            url: "https://soundcloud.com/a16z/a16z-podcast-everything-you-need-to-know-about-amazon",
            content: nil,
            title: "Everything You Need to Know About Amazon",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: podcast
          }
        ]
      },
      {
        username: nil,
        url:"https://www.youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=RF5VIwDYIJk",
            content: nil,
            title: "The End of the Beginning",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: video
          }
        ]
      }
    ]
  },

  # Influencer 9 : Reid Hoffman

  {
    name: 'Reid Hoffman',
    bio: "Reid Garrett Hoffman is an American internet entrepreneur, venture capitalist and author. Hoffman was the co-founder and executive chairman of LinkedIn. He is currently a partner at the venture capital firm Greylock Partners.",
    accounts: [
      {
        username: "reidhoffman",
        url:"https://twitter.com/reidhoffman",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"https://www.reidhoffman.org/",
        platform: blog,
        media: [
          {
            url: "https://hbr.org/2019/03/educating-the-next-generation-of-leaders#learn-from-people-not-classes",
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            title: "Learn from People, Not Classes",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://mastersofscale.com/",
        platform: external_blog,
        media: [
          {
            url: "https://rss.art19.com/episodes/f7484bf4-8e1e-4c59-bc47-a4e761805991.mp3",
            content: nil,
            title: "The Reid Hoffman Story (Part 2) — Make everyone a hero",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: podcast
          }
        ]
      },
      {
        username: nil,
        url:"https://www.youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=J-4J9gP1pIo",
            content: nil,
            title: "The secrets of Blitzscaling",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: video
          }
        ]
      }
    ]
  },

  # Influencer 10 : Tim O'Reilly

  {
    name: "Tim O'Reilly",
    bio: "Tim has a history of convening conversations that reshape the computer industry. In 1998, he organized the meeting where the term “open source software” was agreed on, and helped the business world understand its importance. In 2004, with the Web 2.0 Summit, he defined how “Web 2.0” represented not only the resurgence of the web after the dot com bust, but a new model for the computer industry, based on big data, collective intelligence, and the internet as a platform.",
    accounts: [
      {
        username: "timoreilly",
        url:"https://twitter.com/timoreilly",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"https://www.oreilly.com/tim/",
        platform: blog,
        media: [
          {
            url: "https://evonomics.com/new-economy-evolution-oreilly-wilson/",
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            title: "Evolving the New Economy: Tim O’Reilly and David Sloan Wilson",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://after-on.com/episodes/",
        platform: external_blog,
        media: [
          {
            url: "https://html5-player.libsyn.com/embed/episode/id/5824897/height/90/theme/custom/thumbnail/yes/direction/backward/render-playlist/no/custom-color/87A93A/",
            content: nil,
            title: "Tech's Past & Future",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: podcast
          }
        ]
      },
      {
        username: nil,
        url:"https://www.youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=xRmQTWpkaVU",
            content: nil,
            title: "Why we'll never run out of jobs",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus."
            format: video
          }
        ]
      }
    ]
  },
]

full_list.each do |influencer|

  # influencer[:name]
  # influencer[:bio]

  this_influencer = Influencer.create! name: influencer[:name], bio: influencer[:bio]

  accounts = influencer[:accounts]


  accounts.each do |account|

    # account[:username]
    # account[:url]
    # account[:platform]

    this_account = Account.create! username: account[:username], url: account[:url], platform: account[:platform], influencer: this_influencer

    media = account[:media]

    media.each do |medium|

      # medium[:title]
      # medium[:content]
      # medium[:url]
      # medium[:format]

      this_medium = Medium.create! title: medium[:title], content: medium[:content], url: medium[:url], format: medium[:format], influencer: this_influencer, platform: this_account.platform
    end
  end
end

puts 'Database created'

## --------------------------------------------------------------------------------

  # # Influencer # : Influencer_name

  # {
  #   name: '',
  #   bio: "",
  #   accounts: [
  #     {
  #       username: "",
  #       url:"",
  #       platform: ,
  #       media: [
  #         {
  #           url: "",
  #           content: ,
  #           title: ,
  #           format:
  #         }
  #       ]
  #     },
  #     {
  #       username: ,
  #       url:"",
  #       platform: ,
  #       media: [
  #         {
  #           url: "",
  #           content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  #           title: "",
  #           format:
  #         }
  #       ]
  #     },
  #     {
  #       username: ,
  #       url:"",
  #       platform: ,
  #       media: [
  #         {
  #           url: "",
  #           content: ,
  #           title: "",
  #           format:
  #         }
  #       ]
  #     },
  #     {
  #       username: ,
  #       url:"",
  #       platform: ,
  #       media: [
  #         {
  #           url: "",
  #           content: ,
  #           title: "",
  #           format:
  #         }
  #       ]
  #     }
  #   ]
  # },



# # -------------------------------------------------------------------------------

# # Creating each type of platforms

# puts 'Creating platforms list'
# platforms_list = [
#   {name: "Twitter", weight: 1.0},
#   {name: "Blog", weight: 1.0},
#   {name: "Newsletter", weight: 1.0},
#   {name: "Medium", weight: 1.0}
# ]
# platforms_list.each {|platform| Platform.create!(name: platform[:name], weight: platform[:weight])}


# # Creating each type of medium format

# puts 'Creating formats list'
# formats_list = [
#   {type_of: "article", weight: 1.0},
#   {type_of: "tweet", weight: 0.25},
#   {type_of: "podcast", weight: 1.0},
#   {type_of: "video", weight: 1.0}
# ]
# formats_list.each {|format_type| Format.create!(type_of: format_type[:type_of], weight: format_type[:weight])}


# # Creating list of tech influencers

# puts 'Creating influencers list'
# influencers_list = [
#   {name: "Paul Graham", bio: "Programmer, writer, and investor. In 1995, he and Robert Morris started Viaweb, the first software as a service company. Viaweb was acquired by Yahoo in 1998, where it became Yahoo Store. In 2001 he started publishing essays on paulgraham.com, which in 2015 got 34 million page views. In 2005 he and Jessica Livingston, Robert Morris, and Trevor Blackwell started Y Combinator, the first of a new type of startup incubator. Since 2005 Y Combinator has funded over 1000 startups, including Dropbox, Airbnb, Stripe, and Reddit."},
#   {name: "Brian Balfour", bio: "Founder/CEO of Reforge, previously VP Growth @ HubSpot. Brian Balfour has started multiple VC backed companies, and grown user bases to millions of daily active users. He writes detailed essays on growth and user acquisition that have been featured in Forbes, Hacker Monthly, and OnStartups to help build a growth machine."},
#   {name: "Andrew Chen", bio: "Investor at Andreessen Horowitz, where he focuses on consumer products, marketplaces, and bottoms up SaaS. Previously, he led growth teams at Uber."},
#   {name: "Marc Andreessen", bio: "Marc Andreessen is a cofounder and general partner of the venture capital firm Andreessen Horowitz. He is an innovator and creator, one of the few to pioneer a software category used by more than a billion people and one of the few to establish multiple billion-dollar companies. \n
#     Marc co-created the highly influential Mosaic Internet browser and co-founded Netscape, which later sold to AOL for $4.2 billion. He also co-founded Loudcloud, which as Opsware, sold to Hewlett-Packard for $1.6 billion. He later served on the board of Hewlett-Packard from 2008 to 2018."},
#   {name: "Benedict Evans", bio: "I work at Andreessen Horowitz ('a16z'), a venture capital firm in Silicon Valley that invests in technology companies. I try to work out what's going on and what will happen next."}
#   {name: "Chris Dixon", bio: "Chris Dixon (born 1972) is an American internet entrepreneur and investor. He is a general partner at the venture capital firm Andreessen Horowitz, and previously worked at eBay. He is also the co-founder and former CEO of Hunch."},
#   {name: "James Currier", bio: "James is one of Silicon Valley’s foremost experts in growth and network effects. He's a four-time serial entrepreneur. He is also a pioneer of user-generated models, viral marketing, a/b testing, crowdsourcing, and myriad other growth techniques now followed by nearly all technology companies."},
#   {name: "Sam Altman", bio: "Sam Altman is an American entrepreneur, investor, programmer, and blogger. He is the president of Y Combinator and co-chairman of OpenAI."},
#   {name: "Reid Hoffman", bio: "Reid Garrett Hoffman is an American internet entrepreneur, venture capitalist and author. Hoffman was the co-founder and executive chairman of LinkedIn. He is currently a partner at the venture capital firm Greylock Partners."},
#   {name: "Tim O'Reilly", bio: "Tim has a history of convening conversations that reshape the computer industry. In 1998, he organized the meeting where the term “open source software” was agreed on, and helped the business world understand its importance. In 2004, with the Web 2.0 Summit, he defined how “Web 2.0” represented not only the resurgence of the web after the dot com bust, but a new model for the computer industry, based on big data, collective intelligence, and the internet as a platform."},
#   {name: "Connie Chan", bio: "Connie Chan is a general partner at Andreessen Horowitz where she focuses on consumer tech investments. Since joining the firm in 2011, Connie has worked on the investment team sourcing consumer tech deals including Pinterest and Lime and worked closely with startups across the portfolio."},
# ]
# influencers_list.each {|influencer| Influencer.create!(name: influencer[:name], bio: influencer[:bio])}


# # Linking influencers account with each platform's type

# puts 'Creating accounts list'
# twitter = Platform.find_by name: "Twitter"
# blog = Platform.find_by name: "Blog"

# influencer = Influencer.find_by name: "Paul Graham"
# accounts_list = [
#   {username: "paulg", url:"https://twitter.com/paulg", platform: twitter, influencer: influencer},
#   {username: nil, url:"http://paulgraham.com/", platform: blog, influencer: influencer},
# ]
# accounts_list.each {|account| Account.create!(username: account[:username], url: account[:url], platform: account[:platform], influencer: account[:influencer])}


# # Creating a list of media for each influencer

# puts 'Creating media list'
# article = Format.find_by type_of: "article"
# tweet = Format.find_by type_of: "tweet"
# media_list = [
#   {url: "http://paulgraham.com/sun.html", content: "The most valuable insights are both general and surprising. F = ma for example. But general and surprising is a hard combination to achieve. That territory tends to be picked clean, precisely because those insights are so valuable.\n
# Ordinarily, the best that people can do is one without the other: either surprising without being general (e.g. gossip), or general without being surprising (e.g. platitudes).\n
# Where things get interesting is the moderately valuable insights. You get those from small additions of whichever quality was missing. The more common case is a small addition of generality: a piece of gossip that's more than just gossip, because it teaches something interesting about the world. But another less common approach is to focus on the most general ideas and see if you can find something new to say about them. Because these start out so general, you only need a small delta of novelty to produce a useful insight.\n
# A small delta of novelty is all you'll be able to get most of the time. Which means if you take this route, your ideas will seem a lot like ones that already exist. Sometimes you'll find you've merely rediscovered an idea that did already exist. But don't be discouraged. Remember the huge multiplier that kicks in when you do manage to think of something even a little new.\n
# Corollary: the more general the ideas you're talking about, the less you should worry about repeating yourself. If you write enough, it's inevitable you will. Your brain is much the same from year to year and so are the stimuli that hit it. I feel slightly bad when I find I've said something close to what I've said before, as if I were plagiarizing myself. But rationally one shouldn't. You won't say something exactly the same way the second time, and that variation increases the chance you'll get that tiny but critical delta of novelty.\n
# And of course, ideas beget ideas. (That sounds familiar.) An idea with a small amount of novelty could lead to one with more. But only if you keep going. So it's doubly important not to let yourself be discouraged by people who say there's not much new about something you've discovered. 'Not much new' is a real achievement when you're talking about the most general ideas.\n
# It's not true that there's nothing new under the sun. There are some domains where there's almost nothing new. But there's a big difference between nothing and almost nothing, when it's multiplied by the area under the sun.", title: "General and Surprising", influencer: influencer, format: article, platform: blog},
#   {url: "https://twitter.com/paulg/status/1099648921180217345", content: nil, title: nil, influencer: influencer, format: tweet, platform: blog}
# ]
# media_list.each {|medium| Medium.create!(url: medium[:url], content: medium[:content], title: medium[:title], influencer: medium[:influencer], format: medium[:format], platform: medium[:platform])}


# # puts 'Creating states list'
# # states_list = []


