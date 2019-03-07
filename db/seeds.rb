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
    bio: "Programmer, writer, and investor. In 1995, he and Robert Morris started Viaweb, the first software as a service company. Viaweb was acquired by Yahoo in 1998, where it became Yahoo Store. In 2001 he started publishing essays on paulgraham.com, which in 2015 got 34 million page views.",
    accounts: [
      {
        username: "paulg",
        url:"https://twitter.com/paulg",
        platform: twitter,
        media: [
          {
            url: "https://twitter.com/paulg/status/1100885951033810947",
            content: "Startups don't win by having a cleverer fundraising strategy than their competitors. They win by having a better product. So focus on your product, not on optimizing fundraising.",
            title: nil,
            header: nil,
            format: tweet
          }
        ]
      },
      {
        username: nil,
        url:"http://paulgraham.com/",
        platform: blog,
        media: [
          {
            url: "http://paulgraham.com/ds.html",
            content: "<p>
July 2013<br><br>One of the most common types of advice we give at Y Combinator is to do things that don't scale.  A lot of would-be founders believe that startups either take off or don't.  You build something, make it available, and if you've made a better mousetrap, people beat a path to your door as promised.  Or they don't, in which case the market must not exist.<br><br>Actually startups take off because the founders make them take off. There may be a handful that just grew by themselves, but usually it takes some sort of push to get them going. A good metaphor would be the cranks that car engines had before they got electric starters. Once the engine was going, it would keep going, but there was a separate and laborious process to get it going.<br><br><b>Recruit</b><br><br>The most common unscalable thing founders have to do at the start is to recruit users manually.  Nearly all startups have to.  You can't wait for users to come to you. You have to go out and get them.<br><br>Stripe is one of the most successful startups we've funded, and the problem they solved was an urgent one. If anyone could have sat back and waited for users, it was Stripe.  But in fact they're famous within YC for aggressive early user acquisition.<br><br>Startups building things for other startups have a big pool of potential users in the other companies we've funded, and none took better advantage of it than Stripe.  At YC we use the term 'Collison installation' for the technique they invented.  More diffident founders ask 'Will you try our beta?' and if the answer is yes, they say 'Great, we'll send you a link.'  But the Collison brothers weren't going to wait. When anyone agreed to try Stripe they'd say 'Right then, give me your laptop' and set them up on the spot.<br><br>There are two reasons founders resist going out and recruiting users individually.  One is a combination of shyness and laziness.  They'd rather sit at home writing code than go out and talk to a bunch of strangers and probably be rejected by most of them.  But for a startup to succeed, at least one founder (usually the CEO) will have to spend a lot of time on sales and marketing.<br><br>The other reason founders ignore this path is that the absolute numbers seem so small at first.  This can't be how the big, famous startups got started, they think. The mistake they make is to underestimate the power of compound growth.  We encourage every startup to measure their progress by weekly <a class='article_highlight' href='growth.html'>growth rate</a>.  If you have 100 users, you need to get 10 more next week to grow 10% a week.  And while 110 may not seem much better than 100, if you keep growing at 10% a week you'll be surprised how big the numbers get.  After a year you'll have 14,000 users, and after 2 years you'll have 2 million.<br><br>You'll be doing different things when you're acquiring users a thousand at a time, and growth has to slow down eventually.  But if the market exists you can usually start by recruiting users manually and then gradually switch to less manual methods.<br><br>Airbnb is a classic example of this technique.  Marketplaces are so hard to get rolling that you should expect to take heroic measures at first. In Airbnb's case, these consisted of going door to door in New York, recruiting new users and helping existing ones improve their listings.  When I remember the Airbnbs during YC, I picture them with rolly bags, because when they showed up for tuesday dinners they'd always just flown back from somewhere.<br><br><b>Fragile</b><br><br>Airbnb now seems like an unstoppable juggernaut, but early on it was so fragile that about 30 days of going out and engaging in person with users made the difference between success and failure.<br><br>That initial fragility was not a unique feature of Airbnb.  Almost all startups are fragile initially.  And that's one of the biggest things inexperienced founders and investors (and reporters and know-it-alls on forums) get wrong about them.  They unconsciouslyjudge larval startups by the standards of established ones.  They'relike someone looking at a newborn baby and concluding 'there's noway this tiny creature could ever accomplish anything.'<br><br>It's harmless if reporters and know-it-alls dismiss your startup.They always get things wrong.   It's even ok if investors dismissyour startup; they'll change their minds when they see growth.  Thebig danger is that you'll dismiss your startup yourself.  I've seenit happen.  I often have to encourage founders who don't see thefull potential of what they're building.  Even Bill Gates made thatmistake.  He returned to Harvard for the fall semester after startingMicrosoft.  He didn't stay long, but he wouldn't have returned atall if he'd realized Microsoft was going to be even a fraction ofthe size it turned out to be.<font color=$temp-low>[<a class='article_highlight' href='#f4n'><font color=$temp-low>4</font></a>]</font><br><br>The question to ask about an early stage startup is not 'is thiscompany taking over the world?'  but 'how big could this companyget if the founders did the right things?'  And the right thingsoften seem both laborious and inconsequential at the time. Microsoftcan't have seemed very impressive when it was just a couple guysin Albuquerque writing Basic interpreters for a market of a fewthousand hobbyists (as they were then called), but in retrospectthat was the optimal path to dominating microcomputer software.And I know Brian Chesky and Joe Gebbia didn't feel like they wereen route to the big time as they were taking 'professional' photosof their first hosts' apartments.  They were just trying to survive.But in retrospect that too was the optimal path to dominating a bigmarket.<br><br>How do you find users to recruit manually?  If you build somethingto solve <a class='article_highlight' href='startupideas.html'>your own problems</a>, thenyou only have to find your peers, which is usually straightforward.Otherwise you'll have to make a more deliberate effort to locatethe most promising vein of users.  The usual way to do that is toget some initial set of users by doing a comparatively untargetedlaunch, and then to observe which kind seem most enthusiastic, andseek out more like them.  For example, Ben Silbermann noticed thata lot of the earliest Pinterest users were interested in design,so he went to a conference of design bloggers to recruit users, andthat worked well.<font color=$temp-low>[<a class='article_highlight' href='#f5n'><font color=$temp-low>5</font></a>]</font><br><br><b>Delight</b><br><br>You should take extraordinary measures not just to acquire users,but also to make them happy.  For as long as they could (whichturned out to be surprisingly long), Wufoo sent each new user ahand-written thank you note.  Your first users should feel thatsigning up with you was one of the best choices they ever made.And you in turn should be racking your brains to think of new waysto delight them.<br><br>Why do we have to teach startups this?  Why is it counterintuitivefor founders?  Three reasons, I think.<br><br>One is that a lot of startup founders are trained as engineers,and customer service is not part of the training of engineers.You're supposed to build things that are robust and elegant, notbe slavishly attentive to individual users like some kind ofsalesperson.  Ironically, part of the reason engineering is traditionally averse to handholding is that its traditions date from a time when engineers were less powerful &mdash; when they were only in charge of their narrow domain of building things, rather than running the whole show.  You can be ornery when you're Scotty, but not when you're Kirk.<br><br>Another reason founders don't focus enough on individual customers is that they worry it won't scale.  But when founders of larval startups worry about this, I point out that in their current state they have nothing to lose.  Maybe if they go out of their way to make existing users super happy, they'll one day have too many to do so much for.  That would be a great problem to have.  See if you can make it happen.  And incidentally, when it does, you'll find that delighting customers scales better than you expected.  Partly because you can usually find ways to make anything scale more than you would have predicted, and partly because delighting customers will by then have permeated your culture.<br><br>I have never once seen a startup lured down a blind alley by trying too hard to make their initial users happy.<br><br>But perhaps the biggest thing preventing founders from realizing how attentive they could be to their users is that they've never experienced such attention themselves.  Their standards for customer service have been set by the companies they've been customers of, which are mostly big ones.  Tim Cook doesn't send you a hand-written note after you buy a laptop.  He can't.  But you can.  That's one advantage of being small: you can provide a level of service no big company can. <font color=$temp-low>[<a class='article_highlight' href='#f6n'><font color=$temp-low>6</font></a>]</font><br><br>Once you realize that existing conventions are not the upper bound on user experience, it's interesting in a very pleasant way to think about how far you could go to delight your users.<br><br><b>Experience</b><br><br>I was trying to think of a phrase to convey how extreme your attention to users should be, and I realized Steve Jobs had already done it: insanely great.  Steve wasn't just using 'insanely' as a synonym for 'very.'  He meant it more literally &mdash; that one should focus on quality of execution to a degree that in everyday life would be considered pathological.<br><br>All the most successful startups we've funded have, and that probably doesn't surprise would-be founders.  What novice founders don't get is what insanely great translates to in a larval startup.  When Steve Jobs started using that phrase, Apple was already an established company.  He meant the Mac (and its documentation and even packaging &mdash; such is the nature of obsession) should be insanely well designed and manufactured.  That's not hard for engineers to grasp.  It's just a more extreme version of designing a robust and elegant product.<br><br>What founders have a hard time grasping (and Steve himself might have had a hard time grasping) is what insanely great morphs into as you roll the time slider back to the first couple months of a startup's life.  It's not the product that should be insanely great, but the experience of being your user.  The product is just one component of that.  For a big company it's necessarily the dominant one.  But you can and should give users an insanely great experience with an early, incomplete, buggy product, if you make up the difference with attentiveness.<br><br>Can, perhaps, but should?  Yes.  Over-engaging with early users is not just a permissible technique for getting growth rolling.  For most successful startups it's a necessary part of the feedback loop that makes the product good.  Making a better mousetrap is not an atomic operation.  Even if you start the way most successful startups have, by building something you yourself need, the first thing you build is never quite right.  And except in domains with big penalties for making mistakes, it's often better not to aim for perfection initially.  In software, especially, it usually works best to get something in front of users as soon as it has a quantum of utility, and then see what they do with it.  Perfectionism is often an excuse for procrastination, and in any case your initial model of users is always inaccurate, even if you're one of them. <font color=$temp-low>[<a class='article_highlight' href='#f7n'><font color=$temp-low>7</font></a>]</font><br><br>The feedback you get from engaging directly with your earliest users will be the best you ever get.  When you're so big you have to resort to focus groups, you'll wish you could go over to your users' homes and offices and watch them use your stuff like you did when there were only a handful of them.<br><br><b>Fire</b><br><br>Sometimes the right unscalable trick is to focus on a deliberately narrow market.  It's like keeping a fire contained at first to get it really hot before adding more logs.<br><br>That's what Facebook did.  At first it was just for Harvard students. In that form it only had a potential market of a few thousand people, but because they felt it was really for them, a critical mass of them signed up.  After Facebook stopped being for Harvard students, it remained for students at specific colleges for quite a while. When I interviewed Mark Zuckerberg at Startup School, he said that while it was a lot of work creating course lists for each school, doing that made students feel the site was their natural home.<br><br>Any startup that could be described as a marketplace usually has to start in a subset of the market, but this can work for other startups as well.  It's always worth asking if there's a subset of the market in which you can get a critical mass of users quickly. <font color=$temp-low>[<a class='article_highlight' href='#f8n'><font color=$temp-low>8</font></a>]</font><br><br>Most startups that use the contained fire strategy do it unconsciously. They build something for themselves and their friends, who happen to be the early adopters, and only realize later that they could offer it to a broader market.  The strategy works just as well if you do it unconsciously.  The biggest danger of not being consciously aware of this pattern is for those who naively discard part of it. E.g. if you don't build something for yourself and your friends, or even if you do, but you come from the corporate world and your friends are not early adopters, you'll no longer have a perfect initial market handed to you on a platter.<br><br>Among companies, the best early adopters are usually other startups. They're more open to new things both by nature and because, having just been started, they haven't made all their choices yet.  Plus when they succeed they grow fast, and you with them.  It was one of many unforeseen advantages of the YC model (and specifically of making YC big) that B2B startups now have an instant market of hundreds of other startups ready at hand.<br><br><b>Meraki</b><br><br>For <a class='article_highlight' href='hw.html'>hardware startups</a> there's a variant of doing things that don't scale that we call 'pulling a Meraki.' Although we didn't fund Meraki, the founders were Robert Morris's grad students, so we know their history.  They got started by doing something that really doesn't scale: assembling their routers themselves.<br><br>Hardware startups face an obstacle that software startups don't. The minimum order for a factory production run is usually several hundred thousand dollars.  Which can put you in a catch-22: without a product you can't generate the growth you need to raise the money to manufacture your product.  Back when hardware startups had to rely on investors for money, you had to be pretty convincing to overcome this.  The arrival of crowdfunding (or more precisely, preorders) has helped a lot.  But even so I'd advise startups to pull a Meraki initially if they can.  That's what Pebble did.  The Pebbles <a class='article_highlight' href='https://sep.yimg.com/ty/cdn/paulgraham/eric.jpg?t=1536171877&'>assembled</a>  the first several hundred watches themselves. If they hadn't gone through that phase, they probably wouldn't have sold $10 million worth of watches when they did go on Kickstarter.<br><br>Like paying excessive attention to early customers, fabricating things yourself turns out to be valuable for hardware startups. You can tweak the design faster when you're the factory, and you learn things you'd never have known otherwise.  Eric Migicovsky of Pebble said one of things he learned was 'how valuable it was to source good screws.'   Who knew?<br><br><b>Consult</b><br><br>Sometimes we advise founders of B2B startups to take over-engagement to an extreme, and to pick a single user and act as if they were consultants building something just for that one user.   The initial user serves as the form for your mold; keep tweaking till you fit their needs perfectly, and you'll usually find you've made something other users want too.  Even if there aren't many of them, there are probably adjacent territories that have more.  As long as you can find just one user who really needs something and can act on that need, you've got a toehold in making something people want, and that's as much as any startup needs initially. <font color=$temp-low>[<a class='article_highlight' href='#f9n'><font color=$temp-low>9</font></a>]</font><br><br>Consulting is the canonical example of work that doesn't scale. But (like other ways of bestowing one's favors liberally) it's safe to do it so long as you're not being paid to.  That's where companies cross the line.  So long as you're a product company that's merely being extra attentive to a customer, they're very grateful even if you don't solve all their problems.  But when they start paying you specifically for that attentiveness &mdash; when they start paying you by the hour &mdash; they expect you to do everything.<br><br>Another consulting-like technique for recruiting initially lukewarm users is to use your software yourselves on their behalf.  We did that at Viaweb.  When we approached merchants asking if they wanted to use our software to make online stores, some said no, but they'd let us make one for them.  Since we would do anything to get users, we did.  We felt pretty lame at the time.  Instead of organizing big strategic e-commerce partnerships, we were trying to sell luggage and pens and men's shirts.  But in retrospect it was exactly the right thing to do, because it taught us how it would feel to merchants to use our software.  Sometimes the feedback loop was near instantaneous: in the middle of building some merchant's site I'd find I needed a feature we didn't have, so I'd spend a couple hours implementing it and then resume building the site.<br><br><b>Manual</b><br><br>There's a more extreme variant where you don't just use your software, but are your software.  When you only have a small number of users, you can sometimes get away with doing by hand things that you plan to automate later.  This lets you launch faster, and when you do finally automate yourself out of the loop, you'll know exactly what to build because you'll have muscle memory from doing it yourself.<br><br>When manual components look to the user like software, this technique starts to have aspects of a practical joke.  For example, the way Stripe delivered 'instant' merchant accounts to its first users was that the founders manually signed them up for traditional merchant accounts behind the scenes.<br><br>Some startups could be entirely manual at first. If you can find someone with a problem that needs solving and you can solve it manually, go ahead and do that for as long as you can, and then gradually automate the bottlenecks.  It would be a little frightening to be solving users' problems in a way that wasn't yet automatic, but less frightening than the far more common case of having something automatic that doesn't yet solve anyone's problems.<br><br><b>Big</b><br><br>I should mention one sort of initial tactic that usually doesn't work: the Big Launch.  I occasionally meet founders who seem to believe startups are projectiles rather than powered aircraft, and that they'll make it big if and only if they're launched with sufficient initial velocity.  They want to launch simultaneously in 8 different publications, with embargoes.  And on a tuesday, of course, since they read somewhere that's the optimum day to launch something.<br><br>It's easy to see how little launches matter.  Think of some successful startups.  How many of their launches do you remember? All you need from a launch is some initial core of users.  How well you're doing a few months later will depend more on how happy you made those users than how many there were of them. <font color=$temp-low>[<a class='article_highlight' href='#f10n'><font color=$temp-low>10</font></a>]</font><br><br>So why do founders think launches matter?  A combination of solipsism and laziness.  They think what they're building is so great that everyone who hears about it will immediately sign up.  Plus it would be so much less work if you could get users merely by broadcasting your existence, rather than recruiting them one at a time.  But even if what you're building really is great, getting users will always be a gradual process &mdash; partly because great things are usually also novel, but mainly because users have other things to think about.<br><br>Partnerships too usually don't work.  They don't work for startups in general, but they especially don't work as a way to get growth started.  It's a common mistake among inexperienced founders to believe that a partnership with a big company will be their big break.  Six months later they're all saying the same thing: that was way more work than we expected, and we ended up getting practically nothing out of it. <font color=$temp-low>[<a class='article_highlight' href='#f11n'><font color=$temp-low>11</font></a>]</font><br><br>It's not enough just to do something extraordinary initially.  You have to make an extraordinary <i>effort</i> initially.  Any strategy that omits the effort &mdash; whether it's expecting a big launch to get you users, or a big partner &mdash; is ipso facto suspect.<br><br><b>Vector</b><br><br>The need to do something unscalably laborious to get started is so nearly universal that it might be a good idea to stop thinking of startup ideas as scalars.  Instead we should try thinking of them as pairs of what you're going to build, plus the unscalable thing(s) you're going to do initially to get the company going.<br><br>It could be interesting to start viewing startup ideas this way, because now that there are two components you can try to be imaginative about the second as well as the first.  But in most cases the second component will be what it usually is &mdash; recruit users manually and give them an overwhelmingly good experience &mdash; and the main benefit of treating startups as vectors will be to remind founders they need to work hard in two dimensions. <font color=$temp-low>[<a class='article_highlight' href='#f12n'><font color=$temp-low>12</font></a>]</font><br><br>In the best case, both components of the vector contribute to your company's DNA: the unscalable things you have to do to get started are not merely a necessary evil, but change the company permanently for the better.  If you have to be aggressive about user acquisition when you're small, you'll probably still be aggressive when you're big.  If you have to manufacture your own hardware, or use your software on users's behalf, you'll learn things you couldn't have learned otherwise.  And most importantly, if you have to work hard to delight users when you only have a handful of them, you'll keep doing it when you have a lot.<br><br><br><br><br><br><br><br><b>Notes</b><br><br>[<a class='article_highlight' name='f1n'><font color=#000000>1</font></a>] Actually Emerson never mentioned mousetraps specifically.  He wrote 'If a man has good corn or wood, or boards, or pigs, to sell, or can make better chairs or knives, crucibles or church organs, than anybody else, you will find a broad hard-beaten road to his house, though it be in the woods.'<br><br>[<a class='article_highlight' name='f2n'><font color=#000000>2</font></a>] Thanks to Sam Altman for suggesting I make this explicit. And no, you can't avoid doing sales by hiring someone to do it for you.  You have to do sales yourself initially.  Later you can hire a real salesperson to replace you.<br><br>[<a class='article_highlight' name='f3n'><font color=#000000>3</font></a>] The reason this works is that as you get bigger, your size helps you grow.  Patrick Collison wrote 'At some point, there was a very noticeable change in how Stripe felt. It tipped from being this boulder we had to push to being a train car that in fact had its own momentum.'<br><br>[<a class='article_highlight' name='f4n'><font color=#000000>4</font></a>] One of the more subtle ways in which YC can help founders is by calibrating their ambitions, because we know exactly how a lot of successful startups looked when they were just getting started.<br><br>[<a class='article_highlight' name='f5n'><font color=#000000>5</font></a>] If you're building something for which you can't easily get a small set of users to observe &mdash; e.g. enterprise software &mdash; and in a domain where you have no connections, you'll have to rely on cold calls and introductions.  But should you even be working on such an idea?<br><br>[<a class='article_highlight' name='f6n'><font color=#000000>6</font></a>] Garry Tan pointed out an interesting trap founders fall into in the beginning.  They want so much to seem big that they imitate even the flaws of big companies, like indifference to individual users.  This seems to them more 'professional.'  Actually it's better to embrace the fact that you're small and use whatever advantages that brings.<br><br>[<a class='article_highlight' name='f7n'><font color=#000000>7</font></a>] Your user model almost couldn't be perfectly accurate, because users' needs often change in response to what you build for them. Build them a microcomputer, and suddenly they need to run spreadsheets on it, because the arrival of your new microcomputer causes someone to invent the spreadsheet.<br><br>[<a class='article_highlight' name='f8n'><font color=#000000>8</font></a>] If you have to choose between the subset that will sign up quickest and those that will pay the most, it's usually best to pick the former, because those are probably the early adopters. They'll have a better influence on your product, and they won't make you expend as much effort on sales.  And though they have less money, you don't need that much to maintain your target growth rate early on.<br><br>[<a class='article_highlight' name='f9n'><font color=#000000>9</font></a>] Yes, I can imagine cases where you could end up making something that was really only useful for one user.  But those are usually obvious, even to inexperienced founders.  So if it's not obvious you'd be making something for a market of one, don't worry about that danger.<br><br>[<a class='article_highlight' name='f10n'><font color=#000000>10</font></a>] There may even be an inverse correlation between launch magnitude and success.  The only launches I remember are famous flops like the Segway and Google Wave.  Wave is a particularly alarming example, because I think it was actually a great idea that was killed partly by its overdone launch.<br><br>[<a class='article_highlight' name='f11n'><font color=#000000>11</font></a>] Google grew big on the back of Yahoo, but that wasn't a partnership.  Yahoo was their customer.<br><br>[<a class='article_highlight' name='f12n'><font color=#000000>12</font></a>] It will also remind founders that an idea where the second component is empty &mdash; an idea where there is nothing you can do to get going, e.g. because you have no way to find users to recruit manually &mdash; is probably a bad idea, at least for those founders.<br><br><b>Thanks</b> to Sam Altman, Paul Buchheit, Patrick Collison, Kevin Hale, Steven Levy, Jessica Livingston, Geoff Ralston, and Garry Tan for reading drafts of this.<br><br>
",
            title: "Do Things That Don't Scale",
            header: "One of the most common types of advice we give at Y Combinator is to do things that don't scale. A lot of would-be founders believe that startups either take off or don't. You build something, make it available, and if you've made a better mousetrap, people beat a path to your door as promised. Or they don't, in which case the market must not exist.",
            format: article
          },
          {
            url: "http://paulgraham.com/start.html",
            content: "<p>
March 2005<br><br><i>(This essay is derived from a talk at the Harvard Computer
Society.)</i><br><br>You need three things to create a successful startup: to start with
good people, to make something customers actually want, and to spend
as little money as possible.  Most startups that fail do it because
they fail at one of these.  A startup that does all three will
probably succeed.<br><br>And that's kind of exciting, when you think about it, because all
three are doable.  Hard, but doable.  And since a startup that
succeeds ordinarily makes its founders rich, that implies getting
rich is doable too.  Hard, but doable.<br><br>If there is one message I'd like to get across about startups,
that's it.  There is no magically difficult step that requires
brilliance to solve.<br><br><b>The Idea</b><br><br>In particular, you don't need a brilliant
<a href='ideas.html'>idea</a> to start a startup
around.   The way a startup makes money is to offer people better
technology than they have now.  But what people have now is often
so bad that it doesn't take brilliance to do better.<br><br>Google's plan, for example, was simply to create a search site that
didn't suck.  They had three new ideas: index more of the Web, use
links to rank search results, and have clean, simple web pages with
unintrusive keyword-based ads.  Above all, they were determined to
make a site that was good to use.  No doubt there are great technical
tricks within Google, but the overall plan was straightforward.
And while they probably have bigger ambitions now, this alone brings
them a billion dollars a year. [1]<br><br>There are plenty of other areas that are just as backward as search
was before Google.  I can think of several heuristics for generating
ideas for startups, but most reduce to this: look at something
people are trying to do, and figure out how to do it in a way that
doesn't suck.<br><br>For example, dating sites currently suck far worse than search did
before Google.  They all use the same simple-minded model.
They seem to have approached the problem by thinking about how to
do database matches instead of how dating works in the real world.
An undergrad could build something better as a class project.  And
yet there's a lot of money at stake.  Online dating is a valuable
business now, and it might be worth a hundred times as much if it
worked.<br><br>An idea for a startup, however, is only a beginning.  A lot of
would-be startup founders think the key to the whole process is the
initial idea, and from that point all you have to do is execute.
Venture capitalists know better.  If you go to VC firms with a
brilliant idea that you'll tell them about if they sign a nondisclosure
agreement, most will tell you to get lost.   That shows how much a
mere idea is worth. The market price is less than the inconvenience
of signing an NDA.<br><br>Another sign of how little the initial idea is worth is the number
of startups that change their plan en route. Microsoft's original
plan was to make money selling programming languages, of all things.
Their current business model didn't occur to them until IBM dropped
it in their lap five years later.<br><br>Ideas for startups are worth something, certainly, but the trouble
is, they're not transferrable.  They're not something you could
hand to someone else to execute.  Their value is mainly as starting
points: as questions for the people who had them to continue thinking
about.<br><br>What matters is not ideas, but the people who have them.  Good
people can fix bad ideas, but good ideas can't save bad people.
<!-- So let's talk about people. --><br><br><b>People</b><br><br>What do I mean by good people?  One of the best tricks I learned
during <a href='road.html'>our</a> startup was a rule for deciding
who to hire.  Could you
describe the person as an animal?  It might be hard to translate
that into another language, but I think everyone in the US knows
what it means.  It means someone who takes their work a little too
seriously; someone who does what they do so well that they pass
right through professional and cross over into obsessive.<br><br>What it means specifically depends on the job: a salesperson who
just won't take no for an answer; a hacker who will stay up till
4:00 AM rather than go to bed leaving code with a bug in it; a PR
person who will cold-call <i>New York Times</i> reporters on their cell
phones; a graphic designer who feels physical pain when something
is two millimeters out of place.<br><br>Almost everyone who worked for us was an animal at what they did.
The woman in charge of sales was so tenacious that I used to feel
sorry for potential customers on the phone with her.  You could
sense them squirming on the hook, but you knew there would be no
rest for them till they'd signed up.<br><br>If you think about people you know, you'll find the animal test is
easy to apply.  Call the person's image to mind and imagine the
sentence 'so-and-so is an animal.'  If you laugh, they're not.  You
don't need or perhaps even want this quality in big companies, but
you need it in a startup.<br><br>For programmers we had three additional tests.  Was the person
genuinely smart?  If so, could they actually get things done?  And
finally, since a few good hackers have unbearable personalities,
could we stand to have them around?<br><br>That last test filters out surprisingly few people.  We could bear
any amount of nerdiness if someone was truly smart.  What we couldn't
stand were people with a lot of attitude.  But most of those weren't
truly smart, so our third test was largely a restatement of the
first.<br><br>When nerds are unbearable it's usually because they're trying too
hard to seem smart.  But the smarter they are, the less pressure
they feel to act smart.  So as a rule you can recognize genuinely
smart people by their ability to say things like 'I don't know,'
'Maybe you're right,' and 'I don't understand x well enough.'<br><br>This technique doesn't always work, because people can be influenced
by their environment.  In the MIT CS department, there seems to be
a tradition of acting like a brusque know-it-all. I'm told it derives
ultimately from Marvin Minsky, in the same way the classic airline
pilot manner is said to derive from Chuck Yeager.  Even genuinely
smart people start to act this way there, so you have to make
allowances.<br><br>It helped us to have Robert Morris, who is one of the readiest to
say 'I don't know' of anyone I've met.  (At least, he was before he
became a professor at MIT.)  No one dared put on attitude around
Robert, because he was obviously smarter than they were and yet had
zero attitude himself.<br><br>Like most startups, ours began with a group of friends, and it was
through personal contacts that we got most of the people we hired.
This is a crucial difference between startups and big companies.
Being friends with someone for even a couple days will tell you
more than companies could ever learn in interviews.  [2]<br><br>It's no coincidence that startups start around universities, because
that's where smart people meet.  It's not what people learn in
classes at MIT and Stanford that has made technology companies
spring up around them.  They could sing campfire songs in the classes
so long as admissions worked the same.<br><br>If you start a startup, there's a good chance it will be with people
you know from college or grad school.  So in theory you ought to
try to make friends with as many smart people as you can in school,
right?  Well, no.  Don't make a conscious effort to schmooze; that
doesn't work well with hackers.<br><br>What you should do in college is work on your own projects.  Hackers
should do this even if they don't plan to start startups, because
it's the only real way to learn how to program.   In some cases you
may collaborate with other students, and this is the best way to
get to know good hackers.  The project may even grow into a startup.
But once again, I wouldn't aim too directly at either target.  Don't
force things; just work on stuff you like with people you like.<br><br>Ideally you want between two and four founders.  It would be hard
to start with just one.  One person would find the moral weight of
starting a company hard to bear.  Even Bill Gates, who seems to be
able to bear a good deal of moral weight, had to have a co-founder.
But you don't want so many founders that the company starts to look
like a group photo.  Partly because you don't need a lot of people
at first, but mainly because the more founders you have, the worse
disagreements you'll have. When there are just two or three founders,
you know you have to resolve disputes immediately or perish.  If
there are seven or eight, disagreements can linger and harden into
factions.  You don't want mere voting; you need unanimity.<br><br>In a technology startup, which most startups are, the founders
should include technical people.   During the Internet Bubble there
were a number of startups founded by business people who then went
looking for hackers to create their product for them.  This doesn't
work well.  Business people are bad at deciding what to do with
technology, because they don't know what the options are, or which
kinds of problems are hard and which are easy.  And when business
people try to hire hackers, they can't tell which ones are
<a href='gh.html'>good</a>.
Even other hackers have a hard time doing that.
For business people it's roulette.<br><br>Do the founders of a startup have to include business people?  That
depends.  We thought so when we started ours, and we asked several
people who were said to know about this mysterious thing called
'business' if they would be the president.  But they all said no,
so I had to do it myself.  And what I discovered was that business
was no great mystery.   It's not something like physics or medicine
that requires extensive study.  You just try to get people to pay
you for stuff.<br><br>I think the reason I made such a mystery of business was that I was
disgusted by the idea of doing it.  I wanted to work in the pure,
intellectual world of software, not deal with customers' mundane
problems.  People who don't want to get dragged into some kind of
work often develop a protective incompetence at it.  Paul Erdos was
particularly good at this.  By seeming unable even to cut a grapefruit
in half (let alone go to the store and buy one), he forced other
people to do such things for him, leaving all his time free for
math.  Erdos was an extreme case, but most husbands use the same
trick to some degree.<br><br>Once I was forced to discard my protective incompetence, I found
that business was neither so hard nor so boring as I feared.  There
are esoteric areas of business that are quite hard, like tax law
or the pricing of derivatives, but you don't need to know about
those in a startup.  All you need to know about business to run a
startup are commonsense things people knew before there were business
schools, or even universities.<br><br>If you work your way down the Forbes 400 making an x next to the
name of each person with an MBA, you'll learn something important
about business school.  After Warren Buffett, you don't hit another
MBA till number 22,
Phil Knight, the CEO of Nike.  There are only 5 MBAs in the top
50.  What you notice in the Forbes 400 are a lot of people with
technical backgrounds.  Bill Gates, Steve Jobs, Larry Ellison,
Michael Dell, Jeff Bezos, Gordon Moore.  The rulers of the technology
business tend to come from technology, not business.  So if you
want to invest two years in something that will help you succeed
in business, the evidence suggests you'd do better to learn how to
hack than get an MBA. [3]<br><br>There is one reason you might want to include business people in a
startup, though: because you have to have at least one person willing
and able to focus on what customers want. Some believe only business
people can do this-- that hackers can implement software, but not
design it.  That's nonsense.  There's nothing about knowing how to
program that prevents hackers from understanding users, or about
not knowing how to program that magically enables business people
to understand them.<br><br>If you can't understand users, however, you should either learn how
or find a co-founder who can.  That is the single most important
issue for technology startups, and the rock that sinks more of them
than anything else.<br><br><b>What Customers Want</b><br><br>It's not just startups that have to worry about this.  I think most
businesses that fail do it because they don't give customers what
they want.  Look at restaurants.  A large percentage fail, about a
quarter in the first year.  But can you think of one restaurant
that had really good food and went out of business?<br><br>Restaurants with great food seem to prosper no matter what.  A
restaurant with great food can be expensive, crowded, noisy, dingy,
out of the way, and even have bad service, and people will keep
coming.  It's true that a restaurant with mediocre food can sometimes
attract customers through gimmicks.  But that approach is very
risky.  It's more straightforward just to make the food good.<br><br>It's the same with technology.  You hear all kinds of reasons why
startups fail.  But can you think of one that had a massively popular
product and still failed?<br><br>In nearly every failed startup, the real problem was that customers
didn't want the product.  For most, the cause of death is listed
as 'ran out of funding,' but that's only the immediate cause.  Why
couldn't they get more funding?  Probably because the product was
a dog, or never seemed likely to be done, or both.<br><br>When I was trying to think of the things every startup needed to
do, I almost included a fourth: get a version 1 out as soon as you
can.  But I decided not to, because that's implicit in making
something customers want.  The only way to make something customers
want is to get a prototype in front of them and refine it based on
their reactions.<br><br>The other approach is what I call the 'Hail Mary' strategy.  You
make elaborate plans for a product, hire a team of engineers to
develop it (people who do this tend to use the term 'engineer' for
hackers), and then find after a year that you've spent two million
dollars to develop something no one wants.  This was not uncommon
during the Bubble, especially in companies run by business types,
who thought of software development as something terrifying that
therefore had to be carefully planned.<br><br>We never even considered that approach.  As a Lisp hacker, I come
from the tradition of rapid prototyping.  I would not claim (at
least, not here) that this is the right way to write every program,
but it's certainly the right way to write software for a startup.
In a startup, your initial plans are almost certain to be wrong in
some way, and your first priority should be to figure out where.
The only way to do that is to try implementing them.<br><br>Like most startups, we changed our plan on the fly.  At first we
expected our customers to be Web consultants.  But it turned out
they didn't like us, because our software was easy to use and we hosted
the site.  It would be too easy for clients to fire them.  We also
thought we'd be able to sign up a lot of catalog companies, because
selling online was a natural extension of their existing business.
But in 1996 that was a hard sell.  The middle managers we talked
to at catalog companies saw the Web not as an opportunity, but as
something that meant more work for them.<br><br>We did get a few of the more adventurous catalog companies.  Among
them was Frederick's of Hollywood, which gave us valuable experience
dealing with heavy loads on our servers.  But most of our users
were small, individual merchants who saw the Web as an opportunity
to build a business.  Some had retail stores, but many only existed
online.  And so we changed direction to focus on these users.
Instead of concentrating on the features Web consultants and catalog
companies would want, we worked to make the software easy to use.<br><br>I learned something valuable from that.  It's worth trying very,
very hard to make technology easy to use.  Hackers are so used to
computers that they have no idea how horrifying software seems to
normal people.  Stephen Hawking's editor told him that every equation
he included in his book would cut sales in half.  When you work on
making technology easier to use, you're riding that curve up instead
of down. A 10% improvement in ease of use doesn't just increase
your sales 10%.  It's more likely to double your sales.<br><br>How do you figure out what customers want?  Watch them.  One of the
best places to do this was at trade shows.  Trade shows didn't pay
as a way of getting new customers, but they were worth it as market
research.  We didn't just give canned presentations at trade shows.
We used to show people how to build real, working stores.  Which
meant we got to watch as they used our software, and talk to them
about what they needed.<br><br>No matter what kind of startup you start, it will probably be a
stretch for you, the founders, to understand what users want.  The
only kind of software you can build without studying users is the
sort for which you are the typical user.  But this is just the kind
that tends to be open source: operating systems, programming
languages, editors, and so on.  So if you're developing technology
for money, you're probably not going to be developing it for people
like you.  Indeed, you can use this as a way to generate ideas for
startups: what do people who are not like you want from technology?<br><br>When most people think of startups, they think of companies like
Apple or Google.  Everyone knows these, because they're big consumer
brands.  But for every startup like that, there are twenty more
that operate in niche markets or live quietly down in the infrastructure.
So if you start a successful startup, odds are you'll start one of
those.<br><br>Another way to say that is, if you try to start the kind of startup
that has to be a big consumer brand, the odds against succeeding
are steeper.  The best odds are in niche markets.  Since startups
make money by offering people something better than they had before,
the best opportunities are where things suck most.  And it would
be hard to find a place where things suck more than in corporate
IT departments.  You would not believe the amount of money companies
spend on software, and the crap they get in return.  This imbalance
equals opportunity.<br><br>If you want ideas for startups, one of the most valuable things you
could do is find a middle-sized non-technology company and spend a
couple weeks just watching what they do with computers.  Most good
hackers have no more idea of the horrors perpetrated in these places
than rich Americans do of what goes on in Brazilian slums.<br><br>Start by writing software for smaller companies, because it's easier
to sell to them.  It's worth so much to sell stuff to big companies
that the people selling them the crap they currently use spend a
lot of time and money to do it.  And while you can outhack Oracle
with one frontal lobe tied behind your back, you can't outsell an
Oracle salesman.  So if you want to win through better technology,
aim at smaller customers.  [4]<br><br>They're the more strategically valuable part of the market anyway.
In technology, the low end always eats the high end.  It's easier
to make an inexpensive product more powerful than to make a powerful
product cheaper.  So the products that start as cheap, simple options
tend to gradually grow more powerful till, like water rising in a
room, they squash the 'high-end' products against the ceiling.  Sun
did this to mainframes, and Intel is doing it to Sun.  Microsoft
Word did it to desktop publishing software like Interleaf and
Framemaker.  Mass-market digital cameras are doing it to the expensive
models made for professionals.  Avid did it to the manufacturers
of specialized video editing systems, and now Apple is doing it to
Avid.  <i>Henry Ford</i> did it to the car makers that preceded
him.  If you build the simple, inexpensive option, you'll not only
find it easier to sell at first, but you'll also be in the best
position to conquer the rest of the market.<br><br>It's very dangerous to let anyone fly under you.  If you have the
cheapest, easiest product, you'll own the low end.  And if you
don't, you're in the crosshairs of whoever does.<br><br><b>Raising Money</b><br><br>To make all this happen, you're going to need money.  Some startups
have been self-funding-- Microsoft for example-- but most aren't.
I think it's wise to take money from investors.  To be self-funding,
you have to start as a consulting company, and it's hard to switch
from that to a product company.<br><br>Financially, a startup is like a pass/fail course.  The way to get
rich from a startup is to maximize the company's chances of succeeding,
not to maximize the amount of stock you retain.  So if you can trade
stock for something that improves your odds, it's probably a smart
move.<br><br>To most hackers, getting investors seems like a terrifying and
mysterious process.  Actually it's merely tedious.  I'll try to
give an outline of how it works.<br><br>The first thing you'll need is a few tens of thousands of dollars
to pay your expenses while you develop a prototype.  This is called
seed capital.  Because so little money is involved, raising seed
capital is comparatively easy-- at least in the sense of getting a
quick yes or no.<br><br>Usually you get seed money from individual rich people called
'angels.' Often they're people who themselves got rich from technology.
At the seed stage, investors don't expect you to have an elaborate
business plan.  Most know that they're supposed to decide quickly.
It's not unusual to get a check within a week based on a half-page
agreement.<br><br>We started Viaweb with $10,000 of seed money from our friend Julian.
But he gave us a lot more than money.  He's a former CEO and also
a corporate lawyer, so he gave us a lot of valuable advice about
business, and also did all the legal work of getting us set up as
a company.  Plus he introduced us to one of the two
angel investors who supplied our next round of funding.<br><br>Some angels, especially those with technology backgrounds, may be
satisfied with a demo and a verbal description of what you plan to
do.  But many will want a copy of your business plan, if only to
remind themselves what they invested in.<br><br>Our angels asked for one, and looking back, I'm amazed how much
worry it caused me.  'Business plan' has that word 'business' in
it, so I figured it had to be something I'd have to read a book
about business plans to write.  Well, it doesn't.  At this stage,
all most investors expect is a brief description of what you plan
to do and how you're going to make money from it, and the resumes
of the founders.  If you just sit down and write out what you've
been saying to one another, that should be fine.  It shouldn't take
more than a couple hours, and you'll probably find that writing it
all down gives you more ideas about what to do.<br><br>For the angel to have someone to make the check out to, you're going
to have to have some kind of company.  Merely incorporating yourselves
isn't hard.  The problem is, for the company to exist, you have to
decide who the founders are, and how much stock they each have.  If
there are two founders with the same qualifications who are both
equally committed to the business, that's easy.  But if you have a
number of people who are expected to contribute in varying degrees,
arranging the proportions of stock can be hard.  And once you've
done it, it tends to be set in stone.<br><br>I have no tricks for dealing with this problem.  All I can say is,
try hard to do it right.  I do have a rule of thumb for recognizing
when you have, though.  When everyone feels they're getting a
slightly bad deal, that they're doing more than they should for the
amount of stock they have, the stock is optimally apportioned.<br><br>There is more to setting up a company than incorporating it, of
course: insurance, business license, unemployment compensation,
various things with the IRS.  I'm not even sure what the list is,
because we, ah, skipped all that.  When we got real funding near
the end of 1996, we hired a great CFO, who fixed everything
retroactively.  It turns out that no one comes and arrests you if
you don't do everything you're supposed to when starting a company.
And a good thing too, or a lot of startups would never get started.
[5]<br><br>It can be dangerous to delay turning yourself into a company, because
one or more of the founders might decide to split off and start
another company doing the same thing.  This does happen.  So when
you set up the company, as well as as apportioning the stock, you
should get all the founders to sign something agreeing that everyone's
ideas belong to this company, and that this company is going to be
everyone's only job.<br><br>[If this were a movie, ominous music would begin here.]<br><br>While you're at it, you should ask what else they've signed.  One
of the worst things that can happen to a startup is to run into
intellectual property problems.  We did, and it came closer to
killing us than any competitor ever did.<br><br>As we were in the middle of getting bought, we discovered that one
of our people had, early on, been bound by an agreement that said
all his ideas belonged to the giant company that was paying for him
to go to grad school.  In theory, that could have meant someone
else owned big chunks of our software.  So the acquisition came to
a screeching halt while we tried to sort this out.  The problem
was, since we'd been about to be acquired, we'd allowed ourselves
to run low on cash.  Now we needed to raise more to keep going.
But it's hard to raise money with an IP cloud over your head, because
investors can't judge how serious it is.<br><br>Our existing investors, knowing that we needed money and had nowhere
else to get it, at this point attempted certain gambits which I
will not describe in detail, except to remind readers that the word
'angel' is a metaphor.  The founders thereupon proposed to walk
away from the company, after giving the investors a brief tutorial
on how to administer the servers themselves.  And while this was
happening, the acquirers used the delay as an excuse to welch on
the deal.<br><br>Miraculously it all turned out ok.  The investors backed down; we
did another round of funding at a reasonable valuation; the giant
company finally gave us a piece of paper saying they didn't own our
software; and six months later we were bought by Yahoo for much
more than the earlier acquirer had agreed to pay.  So we were happy
in the end, though the experience probably took several years off
my life.<br><br>Don't do what we did.  Before you consummate a startup, ask
everyone about their previous IP history.<br><br>Once you've got a company set up, it may seem presumptuous to go
knocking on the doors of rich people and asking them to invest tens
of thousands of dollars in something that is really just a bunch
of guys with some ideas.  But when you look at it from the rich
people's point of view, the picture is more encouraging. Most rich
people are looking for good investments.  If you really think you
have a chance of succeeding, you're doing them a favor by letting
them invest.  Mixed with any annoyance they might feel about being
approached will be the thought: are these guys the next Google?<br><br>Usually angels are financially equivalent to founders.  They get
the same kind of stock and get diluted the same amount in future
rounds.  How much stock should they get?  That depends on how
ambitious you feel.  When you offer x percent of your company for
y dollars, you're implicitly claiming a certain value for the whole
company.  Venture investments are usually described in terms of
that number.  If you give an investor new shares equal to 5% of
those already outstanding in return for $100,000, then you've done
the deal at a pre-money valuation of $2 million.<br><br>How do you decide what the value of the company should be?  There
is no rational way.  At this stage the company is just a bet.  I
didn't realize that when we were raising money.  Julian
thought we ought to value the company at several million
dollars.  I thought it was preposterous to claim that a couple
thousand lines of code, which was all we had at the time, were worth
several million dollars.  Eventually we settled on one millon,
because Julian said no one would invest in a company with a valuation
any lower. [6]<br><br>What I didn't grasp at the time was that the valuation wasn't just
the value of the code we'd written so far.  It was also the value
of our ideas, which turned out to be right, and of all the future
work we'd do, which turned out to be a lot.<br><br>The next round of funding is the one in which you might deal with
actual
<a href='venturecapital.html'>venture capital firms</a>.
But don't wait till you've burned
through your last round of funding to start approaching them.  VCs are slow to
make up their minds.  They can take months.  You don't want to be
running out of money while you're trying to negotiate with them.<br><br>Getting money from an actual VC firm is a bigger deal than getting
money from angels.  The amounts of money involved are larger, millions
usually.  So the deals take longer, dilute you more, and impose
more onerous conditions.<br><br>Sometimes the VCs want to install a new CEO of their own choosing.
Usually the claim is that you need someone mature and experienced,
with a business background.  Maybe in some cases this is true.   And
yet Bill Gates was young and inexperienced and had no business
background, and he seems to have done ok.  Steve Jobs got booted
out of his own company by someone mature and experienced, with a
business background, who then proceeded to ruin the company.  So I
think people who are mature and experienced, with a business
background, may be overrated.  We used to call these guys 'newscasters,'
because they had neat hair and spoke in deep, confident voices, and
generally didn't know much more than they read on the teleprompter.<br><br>We talked to a number of VCs, but eventually we ended up financing
our startup entirely with angel money.  The main reason was that
we feared a brand-name VC firm would stick us with a newscaster as
part of the deal.  That might have been ok if he was content to
limit himself to talking to the press, but what if he wanted to
have a say in running the company?   That would have led to disaster,
because our software was so complex.  We were a company whose whole
m.o. was to win through better technology.  The strategic decisions
were mostly decisions about technology, and we didn't need any help
with those.<br><br>This was also one reason we didn't go public.  Back in 1998 our CFO
tried to talk me into it.  In those days you could go public as a
dogfood portal, so as a company with a real product and real revenues,
we might have done well.  But I feared it would have meant taking
on a newscaster-- someone who, as they say, 'can talk Wall Street's
language.'<br><br>I'm happy to see Google is bucking that trend.  They didn't talk
Wall Street's language when they did their IPO, and Wall Street
didn't buy.  And now Wall Street is collectively kicking itself.
They'll pay attention next time.  Wall Street learns new languages
fast when money is involved.<br><br>You have more leverage negotiating with VCs than you realize.  The
reason is other VCs.  I know a number of VCs now, and when you talk
to them you realize that it's a seller's market.  Even now there
is too much money chasing too few good deals.<br><br>VCs form a pyramid.  At the top are famous ones like Sequoia and
Kleiner Perkins, but beneath those are a huge number you've never
heard of.  What they all have in common is that a dollar from them
is worth one dollar.  Most VCs will tell you that they don't just
provide money, but connections and advice.  If you're talking to
Vinod Khosla or John Doerr or Mike Moritz, this is true.  But such
advice and connections can come very expensive.  And as you go down
the food chain the VCs get rapidly
<!-- href='http://ricksegal.typepad.com/pmv/2005/03/vcs_suck_shocki.html'-->
dumber.  A few steps down from
the top you're basically talking to bankers who've picked up a few
new vocabulary words from reading <i>Wired</i>.  (Does your product
use <i>XML?</i>)  So I'd advise you to be skeptical about claims
of experience and connections.  Basically, a VC is a source of
money.  I'd be inclined to go with whoever offered the most money
the soonest with the least strings attached.<br><br>You may wonder how much to tell VCs.  And you should, because some
of them may one day be funding your competitors.  I think the best
plan is not to be overtly secretive, but not to tell them everything
either.  After all, as most VCs say, they're more interested in the
people than the ideas.  The main reason they want to talk about
your idea is to judge you, not the idea.  So as long as you seem
like you know what you're doing, you can probably keep a few things
back from them. [7]<br><br>Talk to as many VCs as you can, even if you don't want their money,
because a) they may be on the board of someone who will buy you,
and b) if you seem impressive, they'll be discouraged from investing
in your competitors.  The most efficient way to reach VCs, especially
if you only want them to know about you and don't want their money,
is at the conferences that are occasionally organized for startups
to present to them.<br><br><b>Not Spending It</b><br><br>When and if you get an infusion of real money from investors, what
should you do with it?  Not spend it, that's what.  In nearly every
startup that fails, the proximate cause is running out of money.
Usually there is something deeper wrong.  But even a proximate cause
of death is worth trying hard to avoid.<br><br>During the Bubble many startups tried to 'get big fast.' Ideally
this meant getting a lot of customers fast.  But it was easy for
the meaning to slide over into hiring a lot of people fast.<br><br>Of the two versions, the one where you get a lot of customers fast
is of course preferable.  But even that may be overrated.  The idea
is to get there first and get all the users, leaving none for
competitors.  But I think in most businesses the advantages of being
first to market are not so overwhelmingly great.  Google is again
a case in point.  When they appeared it seemed as if search was a
mature market, dominated by big players who'd spent millions to
build their brands: Yahoo, Lycos, Excite, Infoseek, Altavista,
Inktomi.  Surely 1998 was a little late to arrive at the party.<br><br>But as the founders of Google knew, brand is worth next to nothing
in the search business.  You can come along at any point and make
something better, and users will gradually seep over to you.  As
if to emphasize the point, Google never did any advertising.  They're
like dealers; they sell the stuff, but they know better than to use
it themselves.<br><br>The competitors Google buried would have done better to spend those
millions improving their software.  Future startups should learn
from that mistake.  Unless you're in a market where products are
as undifferentiated as cigarettes or vodka or laundry detergent,
spending a lot on brand advertising is a sign of breakage.  And few
if any Web businesses are so undifferentiated.  The dating sites
are running big ad campaigns right now, which is all the
more evidence they're ripe for the picking.  (Fee, fie, fo, fum, I
smell a company run by marketing guys.)<br><br>We were compelled by circumstances to grow slowly, and in retrospect
it was a good thing.  The founders all learned to do every job in
the company.  As well as writing software, I had to do sales and
customer support.  At sales I was not very good.  I was persistent,
but I didn't have the smoothness of a good salesman.  My message
to potential customers was: you'd be stupid not to sell online, and
if you sell online you'd be stupid to use anyone else's software.
Both statements were true, but that's not the way to convince people.<br><br>I was great at customer support though.  Imagine talking to a
customer support person who not only knew everything about the
product, but would apologize abjectly if there was a bug, and then
fix it immediately, while you were on the phone with them.  Customers
loved us.  And we loved them, because when you're growing slow by
word of mouth, your first batch of users are the ones who were smart
enough to find you by themselves.  There is nothing more valuable,
in the early stages of a startup, than smart users.  If you listen
to them, they'll tell you exactly how to make a winning product.
And not only will they give you this advice for free, they'll pay
you.<br><br>We officially launched in early 1996.  By the end of that year we
had about 70 users.  Since this was the era of 'get big fast,' I
worried about how small and obscure we were.  But in fact we were
doing exactly the right thing.  Once you get big (in users or
employees) it gets hard to change your product.  That year was
effectively a laboratory for improving our software.  By the end
of it, we were so far ahead of our competitors that they never had
a hope of catching up.  And since all the hackers had spent many
hours talking to users, we understood online commerce way better
than anyone else.<br><br>That's the key to success as a startup.  There is nothing more
important than understanding your business.  You might think that
anyone in a business must, ex officio, understand it.  Far from it.
Google's secret
weapon was simply that they understood search.  I was working for
Yahoo when Google appeared, and Yahoo didn't understand search.  I
know because I once tried to convince the powers that be that we
had to make search better, and I got in reply what was then the
party line about it: that Yahoo was no longer a mere 'search engine.'
Search was now only a small percentage of our page views, less than
one month's growth, and now that we were established as a 'media
company,' or 'portal,' or whatever we were, search could safely be
allowed to wither and drop off, like an umbilical cord.<br><br>Well, a small fraction of page views they may be, but they are an
important fraction, because they are the page views that Web sessions
start with.  I think Yahoo gets that now.<br><br>Google understands a few other things most Web companies still
don't.  The most important is that you should put users before
advertisers, even though the advertisers are paying and users aren't.
One of my favorite bumper stickers reads 'if the people lead, the
leaders will follow.' Paraphrased for the Web, this becomes 'get
all the users, and the advertisers will follow.'  More generally,
design your product to please users first, and then think about how
to make money from it.  If you don't put users first, you leave a
gap for competitors who do.<br><br>To make something users love, you have to understand them.  And the
bigger you are, the harder that is.  So I say 'get big slow.' The
slower you burn through your funding, the more time you have to
learn.<br><br>The other reason to spend money slowly is to encourage a culture
of cheapness.  That's something Yahoo did understand.  David Filo's
title was 'Chief Yahoo,' but he was proud that his unofficial title
was 'Cheap Yahoo.'  Soon after we arrived at Yahoo, we got an email
from Filo, who had been crawling around our directory hierarchy,
asking if it was really necessary to store so much of our data on
expensive RAID drives.  I was impressed by that.  Yahoo's market
cap then was already in the billions, and they were still worrying
about wasting a few gigs of disk space.<br><br>When you get a couple million dollars from a VC firm, you tend to
feel rich.  It's important to realize you're not.  A rich company
is one with large revenues.  This money isn't revenue.  It's money
investors have given you in the hope you'll be able to generate
revenues.  So despite those millions in the bank, you're still poor.<br><br>For most startups the model should be grad student, not law firm.
Aim for cool and cheap, not expensive and impressive.  For us the
test of whether a startup understood this was whether they had Aeron
chairs.  The Aeron came out during the Bubble and was very popular
with startups.  Especially the type, all too common then, that was
like a bunch of kids playing house with money supplied by VCs.   We
had office chairs so cheap that the arms all fell off.  This was
slightly embarrassing at the time, but in retrospect the grad-studenty
atmosphere of our office was another of those things we did right
without knowing it.<br><br>Our offices were in a wooden triple-decker in Harvard Square.  It
had been an apartment until about the 1970s, and there was still a
claw-footed bathtub in the bathroom.  It must once have been inhabited
by someone fairly eccentric, because a lot of the chinks in the
walls were stuffed with aluminum foil, as if to protect against
cosmic rays.  When eminent visitors came to see us, we were a bit
sheepish about the low production values.  But in fact that place
was the perfect space for a startup.  We felt like our role was to
be impudent underdogs instead of corporate stuffed shirts, and that
is exactly the spirit you want.<br><br>An apartment is also the right kind of place for developing software.
Cube farms suck for that, as you've probably discovered if you've
tried it.  Ever notice how much easier it is to hack at home than
at work?  So why not make work more like home?<br><br>When you're looking for space for a startup, don't feel that it has
to look professional.  Professional means doing good work, not
elevators and glass walls.  I'd advise most startups to avoid
corporate space at first and just rent an apartment.  You want to
live at the office in a startup, so why not have a place designed
to be lived in as your office?<br><br>Besides being cheaper and better to work in, apartments tend to be
in better locations than office buildings.  And for a startup
location is very important.  The key to productivity is for people
to come back to work after dinner.  Those hours after the phone
stops ringing are by far the best for getting work done.  Great
things happen when a group of employees go out to dinner together,
talk over ideas, and then come back to their offices to implement
them.  So you want to be in a place where there are a lot of
restaurants around, not some dreary office park that's a wasteland
after 6:00 PM.  Once a company shifts over into the model where
everyone drives home to the suburbs for dinner, however late, you've
lost something extraordinarily valuable.  God help you if you
actually start in that mode.<br><br>If I were going to start a startup today, there are only three
places I'd consider doing it: on the Red Line near Central, Harvard,
or Davis Squares (Kendall is too sterile); in Palo Alto on University
or California Aves; and in Berkeley immediately north or south of
campus.  These are the only places I know that have the right kind
of vibe.<br><br>The most important way to not spend money is by not hiring people.
I may be an extremist, but I think hiring people is the worst thing
a company can do.  To start with, people are a recurring expense,
which is the worst kind.  They also tend to cause you to grow out
of your space, and perhaps even move to the sort of uncool office
building that will make your software worse.  But worst of all,
they slow you down: instead of sticking your head in someone's
office and checking out an idea with them, eight people have to
have a meeting about it.  So the fewer people you can hire, the
better.<br><br>During the Bubble a lot of startups had the opposite policy.  They
wanted to get 'staffed up' as soon as possible, as if you couldn't
get anything done unless there was someone with the corresponding
job title.  That's big company thinking.  Don't hire people to fill
the gaps in some a priori org chart.  The only reason to hire someone
is to do something you'd like to do but can't.<br><br>If hiring unnecessary people is expensive and slows you down, why
do nearly all companies do it?  I think the main reason is that
people like the idea of having a lot of people working for them.
This weakness often extends right up to the CEO.  If you ever end
up running a company, you'll find the most common question people
ask is how many employees you have.  This is their way of weighing
you.  It's not just random people who ask this; even reporters do.
And they're going to be a lot more impressed if the answer is a
thousand than if it's ten.<br><br>This is ridiculous, really.  If two companies have the same revenues,
it's the one with fewer employees that's more impressive.  When
people used to ask me how many people our startup had, and I answered
'twenty,' I could see them thinking that we didn't count for much.
I used to want to add 'but our main competitor, whose ass we regularly
kick, has a hundred and forty, so can we have credit for the larger
of the two numbers?'<br><br>As with office space, the number of your employees is a choice
between seeming impressive, and being impressive.  Any of you who
were <a href='nerds.html'>nerds</a> in high school know about this
choice.  Keep doing it when you start a company.<br><br><b>Should You?</b><br><br>But should you start a company?  Are you the right sort of person
to do it?  If you are, is it worth it?<br><br>More people are the right sort of person to start a startup than
realize it.  That's the main reason I wrote this.  There could be
ten times more startups than there are, and that would probably be
a good thing.<br><br>I was, I now realize, exactly the right sort of person to start a
startup.  But the idea terrified me at first.  I was forced into
it because I was a <a href='icad.html'>Lisp</a> hacker.  The company
I'd been consulting for seemed to be running into trouble, and there
were not a lot of other companies using Lisp.  Since I couldn't
bear the thought of programming in another language (this was 1995,
remember, when 'another language' meant C++) the only option seemed
to be to start a new company using Lisp.<br><br>I realize this sounds far-fetched, but if you're a Lisp hacker
you'll know what I mean.  And if the idea of starting a startup
frightened me so much that I only did it out of necessity, there
must be a lot of people who would be good at it but who are too
intimidated to try.<br><br>So who should start a startup?  Someone who is a good hacker, between
about 23 and 38, and who wants to solve the money problem in one
shot instead of getting paid gradually over a conventional working
life.<br><br>I can't say precisely what a good hacker is.  At a first rate
university this might include the top half of computer science
majors.  Though of course you don't have to be a CS major to be a
hacker; I was a philosophy major in college.<br><br>It's hard to tell whether you're a good hacker, especially when
you're young.  Fortunately the process of starting startups tends
to select them automatically.  What drives people to start startups
is (or should be) looking at existing technology and thinking, don't
these guys realize they should be doing x, y, and z?  And that's
also a sign that one is a good hacker.<br><br>I put the lower bound at 23 not because there's something that
doesn't happen to your brain till then, but because you need to see
what it's like in an existing business before you try running your
own.  The business doesn't have to be a startup.  I spent a year
working for a software company to pay off my college loans.  It was
the worst year of my adult life, but I learned, without realizing
it at the time, a lot of valuable lessons about the software business.
In this case they were mostly negative lessons: don't have a lot
of meetings; don't have chunks of code that multiple people own;
don't have a sales guy running the company; don't make a high-end
product; don't let your code get too big; don't leave finding bugs
to QA people; don't go too long between releases; don't isolate
developers from users; don't move from Cambridge to Route 128; and
so on. [8] But negative lessons are just as valuable as positive
ones.  Perhaps even more valuable: it's hard to repeat a brilliant
performance, but it's straightforward to avoid errors. [9]<br><br>The other reason it's hard to start a company before 23 is that
people won't take you seriously.  VCs won't trust you, and will try
to reduce you to a mascot as a condition of funding.  Customers
will worry you're going to flake out and leave them stranded.  Even
you yourself, unless you're very unusual, will feel your age to
some degree; you'll find it awkward to be the boss of someone much
older than you, and if you're 21, hiring only people younger rather
limits your options.<br><br>Some people could probably start a company at 18 if they wanted to.
Bill Gates was 19 when he and Paul Allen started Microsoft.  (Paul
Allen was 22, though, and that probably made a difference.) So if
you're thinking, I don't care what he says, I'm going to start a
company now, you may be the sort of person who could get away with
it.<br><br>The other cutoff, 38, has a lot more play in it.  One reason I put
it there is that I don't think many people have the physical stamina
much past that age.   I used to work till 2:00 or 3:00 AM every
night, seven days a week.  I don't know if I could do that now.<br><br>Also,
startups are a big risk financially.  If you try something that
blows up and leaves you broke at 26, big deal; a lot of 26 year
olds are broke.  By 38 you can't take so many risks-- especially
if you have kids.<br><br>My final test may be the most restrictive.  Do you actually want
to start a startup?  What it amounts to, economically, is compressing
your working life into the smallest possible space.  Instead of
working at an ordinary rate for 40 years, you work like hell for
four.  And maybe end up with nothing-- though in that case it
probably won't take four years.<br><br>During this time you'll do little but work, because when you're not
working, your competitors will be.  My only leisure activities were
running, which I needed to do to keep working anyway, and about
fifteen minutes of reading a night.  I had a girlfriend for a total
of two months during that three year period.  Every couple weeks I
would take a few hours off to visit a used bookshop or go to a
friend's house for dinner.  I went to visit my family twice.
Otherwise I just worked.<br><br>Working was often fun, because the people I worked with were some
of my best friends.  Sometimes it was even technically interesting.
But only about 10% of the time.  The best I can say for the other
90% is that some of it is funnier in hindsight than it seemed then.
Like the time the power went off in Cambridge for about six hours,
and we made the mistake of trying to start a gasoline powered
generator inside our offices. I won't try that again.<br><br>I don't think the amount of bullshit you have to deal with in a
startup is more than you'd endure in an ordinary working life.  It's
probably less, in fact; it just seems like a lot because it's
compressed into a short period.  So mainly what a startup buys you
is time.  That's the way to think about it if you're trying to
decide whether to start one.  If you're the sort of person who would
like to solve the money problem once and for all instead of working
for a salary for 40 years, then a startup makes sense.<br><br>For a lot of people the conflict is between startups and graduate
school.  Grad students are just the age, and just the sort of people,
to start software startups.  You may worry that if you do you'll
blow your chances of an academic career.  But it's possible to be
part of a startup and stay in grad school, especially at first.
Two of our three original hackers were in grad school the whole
time, and both got their <a href='tlbphd.html'>degrees</a>.
There are few sources of energy
so powerful as a procrastinating grad student.<br><br>If you do have to
leave grad school, in the worst case it won't be for too long.  If
a startup fails, it will probably fail quickly enough that you can
return to academic life.  And if it succeeds, you may find you no
longer have such a burning desire to be an assistant professor.<br><br>If you want to do it, do it.  Starting a startup is not the great
mystery it seems from outside.  It's not something you have to know
about 'business' to do.  Build something users love, and spend less
than you make.  How hard is that?<br><br><br><br><br><br><br><br><b>Notes</b><br><br>[1] Google's revenues are about two billion a year, but half comes
from ads on other sites.<br><br>[2] One advantage startups have over established companies is that
there are no discrimination laws about starting businesses.  For
example, I would be reluctant to start a startup with a woman
who had small children, or was likely to have them soon.  But you're
not allowed to ask prospective employees if they plan to have kids
soon.  Believe it or not, under current US law, you're not even
allowed to discriminate on the basis of intelligence.  Whereas when
you're starting a company, you can discriminate on any basis you
want about who you start it with.<br><br>[3] Learning to hack is a lot cheaper than business school, because
you can do it mostly on your own.  For the price of a Linux box, a
copy of K&R, and a few hours of advice from your neighbor's fifteen
year old son, you'll be well on your way.<br><br>[4] Corollary: Avoid starting a startup to sell things to the biggest
company of all, the government.  Yes, there are lots of opportunities
to sell them technology.  But let someone else start those startups.<br><br>[5] A friend who started a company in Germany told me they do care
about the paperwork there, and that there's more of it.  Which helps
explain why there are not more startups in Germany.<br><br>[6] At the seed stage our valuation was in principle $100,000, because
Julian got 10% of the company.  But this is a very misleading number,
because the money was the least important of the things Julian gave us.<br><br>[7] The same goes for companies that seem to want to acquire you.
There will be a few that are only pretending to in order to pick
your brains.  But you can never tell for sure which these are, so
the best approach is to seem entirely open, but to fail to mention
a few critical technical secrets.<br><br>[8]  I was as bad an employee as this place was a company.  I
apologize to anyone who had to work with me there.<br><br>[9]  You could probably write a book about how to succeed in business
by doing everything in exactly the opposite way from the DMV.<br><br><b>Thanks</b> to Trevor Blackwell, Sarah Harlin, Jessica Livingston,
and Robert Morris for reading drafts of this essay, and to Steve
Melendez and Gregory Price for inviting me to speak.",
            title: "How to Start a Startup",
            header: "You need three things to create a successful startup: to start with good people, to make something customers actually want, and to spend as little money as possible. Most startups that fail do it because they fail at one of these. A startup that does all three will probably succeed.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=4WO5kJChg3w&t=5s",
            content: nil,
            title: "A Conversation with Paul Graham - Moderated by Geoff Ralston",
            header: "YC Partner Geoff Ralston talks with Paul Graham, one of the founders of YC, and tries to draw out as much startup wisdom as possible in an hour of conversation.",
            format: video
          }
        ]
      },
      {
        username: nil,
        url:"https://podcast.app/paul-graham-before-the-startup-e32007888/",
        platform: external_blog,
        media: [
          {
            url: "http://media.awesound.com/t/tnen38obk.mp3?auid=aCAGmNdgRJ",
            content: nil,
            title: "Paul Graham - Before the Startup",
            header: "Counterintuitive Parts of Startups, and How to Have Ideas Paul Graham delivers an informative (and highly amusing) talk, addressing counterintuitive parts of startups.",
            format: podcast
          }
        ]
      },
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
            url: "https://www.reforge.com/blog/growth-loops",
            content: "<p>The AARRR funnel framework has been the dominant guiding framework to metrics, goal setting, and strategic growth conversations. Funnels were a good starting point but do not accurately represent how the fastest growing products grow. It is time to move past the funnel framework and focus on Growth Loops.<br /><br />This is the third post in a four post series. In the previous posts in the series we went through three important points. <a href='https://www.reforge.com/blog/growth-wins'>Growth wins</a>, <a href='https://www.reforge.com/blog/growth-wins#data'>the game has changed</a>, and to adapt <a href='https://www.reforge.com/blog/growth-system'>we need a system of product, process, and team</a>.<br /><br />This system is just the beginning. We need new frameworks and tools to think about how products grow that incorporate these changes to growth and the lessons we've learned.</p><h2><strong>The Most Important Question Your Team Should Be Able To Answer</strong></h2><p>One thing we ask participants in <strong><a href='https://www.reforge.com/all-programs/'>Reforge Programs</a></strong> is to go around their company and ask five different people to whiteboard the answer to a seemingly simple question: <strong>How does your product grow?</strong><br /><br />This <em><strong>seems</strong> </em>like a simple question. But what everyone inevitably finds is one or more things:</p><ol><li>Everyone has a different answer</li><li>The answer represents only one piece of the puzzle</li><li>The answer talks about the output of $$$, but not the inputs of usage</li></ol><p>This is a BIG problem. If everyone has a different or incomplete picture of how the product grows, then you can't have apples to apples discussions about priorities, metrics, goals, or strategy. This leads to a few things:</p><ul style='margin-left:40px'><li>People focused on different things</li><li>The teams moving in opposite directions</li><li>People not on the same page with CEO/exec team/others as to what is most important</li></ul><p>“How does your product grow?” is simply the most important question to be able to answer. Growing is the entire reason why products and companies exist (especially in venture backed startups). Companies that continually grow also provide the largest positive outcomes. More importantly, personally in your career if you drive growth at your company, you are rewarded vs others who do not drive growth.<br /><br />So, what is the best way to answer this question?</p><h2><strong>Funnels Are Not The Answer</strong></h2><p>One of the common answers to “How does your product grow?” is a picture of a funnel. The funnel AARRR framework was originally created by Dave McClure. It was a great starting point. It helped me and millions of others level up their game. But the framework is now &gt; 11 years old and since then we've learned a lot about how the fastest software products grow.<br /><br />The biggest thing we've learned is that the funnel framework is too micro of a view in order to answer “How does your product grow?” It helps explain a specific step within a Growth Loop, but misses the larger picture of the loop itself. When the funnel is applied at the company level and used to explain how a product grows, it leads to a few common issues:</p><h3><strong>Funnels Create Strategic Silos</strong></h3><p>When building a new product, the most common approach we see is to “build a great product” and then test a lot of different channels to see what works. This is exactly the wrong way to approach it. This treats product strategy and acquisition strategy in silos. In larger more developed products, you see this silo'd strategic planning as well. Typically the product team goes off and plans their product strategy and then marketing goes off and creates the acquisition strategy.<br /><br />This silo'd strategic thinking is the cause for most distribution failures. <strong><a href='https://brianbalfour.com/essays/product-channel-fit-for-growth'>Product Channel Fit</a></strong> tells us why. We commonly forget that we do not control the rules of the channels. The channels control the rules. As a result, we have to mold our product to fit the channels, not the other way around.<br /><br />To make it worse, we also tend to treat our monetization strategy in a third silo. But, we know due to <strong><a href='https://brianbalfour.com/essays/channel-model-fit-for-user-acquisition'>Channel Model Fit</a></strong>, our monetization model enables or disables certain channels.<br /><br />Product, channels, and monetization need to be thought about together. They are interlinked. But the funnel framework leads a lot of teams to treat these as silo'd layers.</p><h3><strong>Funnels Create Functional Silos</strong></h3><p>It is common for companies to structure teams by layers of the funnel. Marketing owns acquisition. Product owns retention. Sales (if B2B) owns revenue. Then each one of those teams is given a metric that corresponds to that layer of the funnel.<br /><br />The problem is that the teams then optimize at the expense of each other in order to reach their silo'd goal. Marketing brings in low quality users/leads at top of funnel to hit their goal, but that tanks retention or further down funnel metrics. All sorts of checks and balances get put in place over time to try and fix this which ends up complicating the understanding and goal setting of the metrics.</p><h3><strong>Funnels Operate In One Direction</strong></h3><p>Funnels operate in one direction. Put more in at the top, get more out at the bottom. There is no concept of how to reinvest what comes out at the bottom to get more at the top to continue to feed growth over time. In other words, no compounding effect. This means we have to keep putting more into the top to get more at the bottom. More money, more people, more tactics, more channels, more, more, more. This is unsustainable. Understanding the connection of how you reinvest to get more growth changes the way you think about where to focus and what to invest in (more on that below).<br /><br />What is a framework that represents how the fastest companies grow? One that combines product, channels, and monetization into one system? One that looks for compounding growth vs linear growth?</p><h2><strong>Growth Loops</strong></h2><blockquote><strong>'Compound interest is man's greatest invention.' - Einstein</strong></blockquote><p>The fastest growing products are better represented as a system of loops, not funnels. Loops are closed systems where the inputs through some process generates more of an output that can be reinvested in the input. There are growth loops that serve different value creation including new users, returning users, defensibility, or efficiency.</p></div></div><div class='sqs-block image-block sqs-block-image' data-block-type='5' id='block-yui_3_17_2_1_1533058994008_91792'><div class='sqs-block-content'>




      <div class='image-block-outer-wrapper layout-caption-hidden design-layout-inline   '>

        <div class='intrinsic' style='max-width:1920.0px;'>

            <div style='padding-bottom:56.25%;' class='image-block-wrapper   has-aspect-ratio' data-description=' >
              <noscript><img src='https://static1.squarespace.com/static/56f152a22fe131e76648aba3/t/5b60a7c688251b6349d7e148/1533061071971/Growth+Loop.jpeg' alt='Growth Loop.jpeg' /></noscript><img class='thumb-image' data-src='https://static1.squarespace.com/static/56f152a22fe131e76648aba3/t/5b60a7c688251b6349d7e148/1533061071971/Growth+Loop.jpeg' data-image='https://static1.squarespace.com/static/56f152a22fe131e76648aba3/t/5b60a7c688251b6349d7e148/1533061071971/Growth+Loop.jpeg' data-image-dimensions='1920x1080' data-image-focal-point='0.5,0.5' alt='Growth Loop.jpeg' data-load='false' data-image-id='5b60a7c688251b6349d7e148' data-type='image' />
            </div>




        </div>

      </div>





</div></div><div class='sqs-block html-block sqs-block-html' data-block-type='2' id='block-yui_3_17_2_1_1533058994008_92073'><div class='sqs-block-content'><p>Here are a couple examples:</p><h3><strong>Pinterest</strong></h3><p>The driving force behind Pinterest's growth is the following loop:</p><ol><li>User signs up (or returns)</li><li>They activate you on the product with specific/relevant content</li><li>You save new content or repin existing content which gives Pinterest quality signals</li><li>Pinterest distributes the quality content to search engines</li><li>A user finds the content via search engines and either signs up/returns (see step 1)</li></ol></div></div><div class='sqs-block image-block sqs-block-image' data-block-type='5' id='block-yui_3_17_2_1_1533058994008_97137'><div class='sqs-block-content'>




      <div class='image-block-outer-wrapper layout-caption-below design-layout-inline   '>

        <div class='intrinsic' style='max-width:1920.0px;'>

            <div style='padding-bottom:56.25%;' class='image-block-wrapper   has-aspect-ratio' data-description='&lt;p&gt;Credit: Casey Winters - https://caseyaccidental.com/what-are-growth-teams-for-and-what-do-they-work-on/&lt;/p&gt;' >
              <noscript><img src='https://static1.squarespace.com/static/56f152a22fe131e76648aba3/t/5b60a7f3562fa7e467cb263f/1533061127245/Pinterest+Growth+Loop.jpeg' alt='Credit: Casey Winters - https://caseyaccidental.com/what-are-growth-teams-for-and-what-do-they-work-on/' /></noscript><img class='thumb-image' data-src='https://static1.squarespace.com/static/56f152a22fe131e76648aba3/t/5b60a7f3562fa7e467cb263f/1533061127245/Pinterest+Growth+Loop.jpeg' data-image='https://static1.squarespace.com/static/56f152a22fe131e76648aba3/t/5b60a7f3562fa7e467cb263f/1533061127245/Pinterest+Growth+Loop.jpeg' data-image-dimensions='1920x1080' data-image-focal-point='0.5,0.5' alt='Credit: Casey Winters - https://caseyaccidental.com/what-are-growth-teams-for-and-what-do-they-work-on/' data-load='false' data-image-id='5b60a7f3562fa7e467cb263f' data-type='image' />
            </div>



          <div class='image-caption-wrapper'>
            <div class='image-caption'><p>Credit: Casey Winters - https://caseyaccidental.com/what-are-growth-teams-for-and-what-do-they-work-on/</p></div>
          </div>


        </div>

      </div>





</div></div><div class='sqs-block html-block sqs-block-html' data-block-type='2' id='block-yui_3_17_2_1_1533058994008_97417'><div class='sqs-block-content'><h3><strong>SurveyMonkey</strong></h3><p>One of the driving forces of SurveyMonkey's growth is the following loop:</p><ol><li>New user signs up</li><li>% creates a survey</li><li>% send that survey to others</li><li>As people finish the survey they see a Survey Monkey landing page</li><li>% of those sign up over time repeating step 1</li></ol></div></div><div class='sqs-block image-block sqs-block-image' data-block-type='5' id='block-yui_3_17_2_1_1533058994008_106498'><div class='sqs-block-content'>




      <div class='image-block-outer-wrapper layout-caption-hidden design-layout-inline   '>

        <div class='intrinsic' style='max-width:1920.0px;'>

            <div style='padding-bottom:56.25%;' class='image-block-wrapper   has-aspect-ratio' data-description=' >
              <noscript><img src='https://static1.squarespace.com/static/56f152a22fe131e76648aba3/t/5b60a84ff950b7af568bc13c/1533061219443/SurveyMonkey+Growth+Loop.jpeg' alt='SurveyMonkey Growth Loop.jpeg' /></noscript><img class='thumb-image' data-src='https://static1.squarespace.com/static/56f152a22fe131e76648aba3/t/5b60a84ff950b7af568bc13c/1533061219443/SurveyMonkey+Growth+Loop.jpeg' data-image='https://static1.squarespace.com/static/56f152a22fe131e76648aba3/t/5b60a84ff950b7af568bc13c/1533061219443/SurveyMonkey+Growth+Loop.jpeg' data-image-dimensions='1920x1080' data-image-focal-point='0.5,0.5' alt='SurveyMonkey Growth Loop.jpeg' data-load='false' data-image-id='5b60a84ff950b7af568bc13c' data-type='image' />
            </div>




        </div>

      </div>





</div></div><div class='sqs-block html-block sqs-block-html' data-block-type='2' id='block-yui_3_17_2_1_1533058994008_106778'><div class='sqs-block-content'><p>These are two of over 20 growth loops we've identified in our research for the <a href='https://www.reforge.com/growth-modeling-series/'><strong>Growth Models </strong>Deep Dive</a> program that drive acquisition, retention, defensibility, efficiency, or a combination. Those that understand them and organize their product/teams around them will be the ones who create the most value. There are two primary reason why Growth Loops are the key to the fastest growing products.</p><h3><strong>Loops Provide Sustainable Compounding Growth</strong></h3><p>Loops force you to answer “How does one cohort of users lead to another cohort of users?” You focus on how you reinvest the output of one cycle of the loop into the next cycle of the loop to get more output. This creates a compounding effect that is more sustainable.<br /><br />Not all loops are created equally. You'll be tempted to draw a ton of loops for your product, but what that typically means is that you just have a ton of low powered loops that aren't sustainable. The fastest growing products are typically powered by 1- 2 major loops that transition over time. Measuring and understanding the power/health of your loops is critical to understanding where to focus.</p><h3><strong>Loops Are More Defensible</strong></h3><p>Loops combine how your product, channel, and monetization model work together in a single system rather than treating them as silos. As a result they end up being more specific to your product and company making them harder for others to replicate.<br /><br />On the other hand, strategies and tactics that aren't specific to your product/user/model by definition can be replicated with ease by others. As they get copied, effectiveness decreases and always trends to zero requiring you to constantly invent new strategies and tactics. This is not sustainable over the long term.</p></div></div><div class='sqs-block image-block sqs-block-image' data-block-type='5' id='block-yui_3_17_2_1_1533058994008_111744'><div class='sqs-block-content'>




      <div class='image-block-outer-wrapper layout-caption-hidden design-layout-inline   '>

        <div class='intrinsic'>

            <div style='padding-bottom:56.25%;' class='image-block-wrapper   has-aspect-ratio' data-description=' >
              <noscript><img src='https://static1.squarespace.com/static/56f152a22fe131e76648aba3/t/5b60a88baa4a997997623427/1533061273909/Lifecycle+Of+A+Growth+Tactic.jpeg' alt='Lifecycle Of A Growth Tactic.jpeg' /></noscript><img class='thumb-image' data-src='https://static1.squarespace.com/static/56f152a22fe131e76648aba3/t/5b60a88baa4a997997623427/1533061273909/Lifecycle+Of+A+Growth+Tactic.jpeg' data-image='https://static1.squarespace.com/static/56f152a22fe131e76648aba3/t/5b60a88baa4a997997623427/1533061273909/Lifecycle+Of+A+Growth+Tactic.jpeg' data-image-dimensions='1920x1080' data-image-focal-point='0.5,0.5' alt='Lifecycle Of A Growth Tactic.jpeg' data-load='false' data-image-id='5b60a88baa4a997997623427' data-type='image' />
            </div>




        </div>

      </div>





</div></div><div class='sqs-block html-block sqs-block-html' data-block-type='2' id='block-yui_3_17_2_1_1533058994008_112024'><div class='sqs-block-content'><h2><strong>Loops Change Everything</strong></h2><p>Once you start looking at things through the loop framework, you start to make very different set of decisions.</p><h3><strong>You Approach Growth From A Different Perspective</strong></h3><p>Once you start viewing things through loops, you stop approaching acquisition, product, and monetization in silos. It forces you to think about how the three work together in a system. You stop thinking about the never ending cycles of more tactics, more channels, more of everything just to keep filling the top of the funnel, and you start thinking about how what you are producing can be reinvested.</p><h3><strong>You Make Investment Decisions Differently</strong></h3><p>If you had two options, which one would you choose?</p><ul style='margin-left:40px'><li><strong>Initiative A: </strong>Output of the initiative gives you 500 new engaged users this week, but nothing after.</li><li><strong>Initiative B: </strong>Output of the initiative gives you 20 new users in week one, 22 in week 2, etc (growing 10% WoW) for every week going forward.</li></ul><p>We really hope you choose Initiative B. This highlights how you make investment decisions differently. Rather than looking for the short term bumps and sugar rushes, loops help you start looking for the things that will compound over time producing much better results over the long term.</p><h3><strong>You Organize and Goal Teams Differently</strong></h3><p>In the second post in the series, we talked about the <strong><a href='https://www.reforge.com/blog/growth-system'>larger need for Cross Functional teams</a></strong> as product, data, engineering, and design play a larger role in outcomes like acquisition, retention, and monetization. Loops as you can see above traverse typical functional lines. To enable and improve them you typically need every function represented working towards the same goal, the output of the loop. This helps the teams align and organize around the loop rather than by function and reduces the teams optimizing at the expense of each other as it will be reflected in the output of the loop.</p><h2><strong>Putting Loops Into Action</strong></h2><p>Understanding loops, how to measure them, and how to map them to your product is just the first step. It is a phenomenal qualitative tool to change the way you think about growing a product. But it is hard to represent all the individual levers and their effect on your metrics. You need to translate your loops into a quantitative growth model to help communicate, prioritize, make strategic bets, set goals, and drive your metrics roadmap. We'll talk about this in the next (and final) post of the series. Subscribe here to make sure you don't miss it.<br /><br /><strong><a href='https://www.reforge.com/growth-modeling-series/'>Go deep on Growth Loops + Models</a></strong> in our upcoming fall program along with other experienced practitioners from Google, Facebook, Spotify, Adobe, HubSpot, and many more. We'll go through the properties that make a loop, detailed examples of 20+ growth loops, how to measure/analyze your loops, and how to build quantitative models.</p>",
            title: "Growth Loops are the New Funnels",
            header: "The AARRR funnel framework has been the dominant guiding framework to metrics, goal setting, and strategic growth conversations. Funnels were a good starting point but do not accurately represent how the fastest growing products grow. It is time to move past the funnel framework and focus on Growth Loops.",
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
            url: "https://andrewchen.co/the-law-of-shitty-clickthroughs/",
            content: "The first banner ad ever, on HotWired in 1994, debuted with a clickthrough rate of 78% (thanks @ottotimmons) \r

First it works, and then it doesn’t
After months of iterating on different marketing strategies, you finally find something that works. However, the moment you start to scale it, the effectiveness of your marketing grinds to a halt. Sound familiar?

Welcome to the Law of Shitty Clickthroughs:

Over time, all marketing strategies result in shitty clickthrough rates.

Here’s a real example – let’s compare the average clickthrough rates of banner ads when debuted on HotWired in 1994 versus Facebook in 2011:

HotWired CTR, 1994: 78%
Facebook CTR, 2011: 0.05%
That’s a 1500X difference. While there are many factors that influence this difference, the basic premise is sound – the clickthrough rates of banner ads, email invites, and many other marketing channels on the web have decayed every year since they were invented.

Here’s another channel, which is email open rates over time, according to eMarketer:



While this graph shows a decline, the other graph (which I don’t have handy) is that the number of emails sent out has increased up to 30+ billion per day.

All these channels are decaying over time, and what’s saving us is the new marketing channels are constantly getting unveiled, too. These new channels offer high performance, because of a lack of competition, big opportunities for novel marketing techniques, and these days, the cutting edge is about optimizing your mobile notifications, not your banner placements.

There are a few drivers for the Law of Shitty Clickthroughs, and here’s a summary of the top ones:

Customers respond to novelty, which inevitably fades
First-to-market never lasts
More scale means less qualified customers
Let’s examine each in more detail, and then discuss the options for combatting this force of gravity in marketing.
Novelty
Without a doubt, one of the key drivers of engagement for marketing is that customers respond to novelty. When HotWired showed banner ads for the first time in history, people clicked just to check out the experience. Same for being the first web product to email people invites to a website – it works for a while, until your customers get used to the effect, and start ignoring it.

One of the most important tools you have at your disposal is the creative and calls to action that you use in your marketing – this might be like “X has invited you to Y” or it might be the headline you use in your banner ads. Recently, Retargeter posted an interesting analysis on the Importance of Rotating Creatives, which showed how keeping the same ad creative led to declining CTRs over time:



Publishers often have a similar problem in consumers ignoring the advertising on their site, which drives down clickthrough rates for both of them (bad for CPMs). This problem is often described as banner blindness, and you can see it clearly here in an eye-tracking study by Jakob Nielsen:



You can see here how users, almost comically, avoid looking at any banners.

The point is, humans seek novelty yet are pattern-recognition machines. Your initial marketing strategy will work quite well as your users try it for the first time, but afterwards, they learn to filter your marketing efforts out unless they are genuinely useful (more on that later).

First-to-market never lasts
It’s bad enough that your own marketing efforts drive down channel performance, but usually once your marketing efforts are working, your competitors quickly follow. There’s a whole cottage industry of companies that provide competitive research in the area of how their competitors are advertising and give you the information needed to fast-follow their marketing efforts.

For example, with a quick query, I know how much Airbnb is spending on search marketing (turns out, millions per year) what keywords they are buying ads on, and who their competitors are. And this is just a free service! There are much more sophisticated products for every established marketing channel:

Airbnb Search Engine Marketing

Daily ad budget: $10,638
Keywords: 62,729
Example ad: Find Affordable Rooms Starting From $20/Day. Browse & Book Online Now!
Main competitors: Expedia.com, booking.com, hotels.com, Marriott.com
Any clone of their business can quickly fast-follow their marketing efforts and use the same ads in the same marketing channels. This quickly degrades the performance of the marketing channel as the novelty wears off and clickthroughs plummet.

Any product that is first to market has a limited window where they will enjoy unnaturally high marketing performance, until the competition enters, in which case everyone’s marketing efforts will degrade.

More scale means less qualified customers
Another important way to think about the available market for your product is in terms of the popular Technology Adoption Lifecycle, in which early adopters actively seek out your product, while the rest of the mainstream market needs a lot of convincing. The quant marketing way to look at this is that early adopters respond better to marketing efforts across any given metric (signup %, CTR, CPA) than the later customer segments. In the TAL framework, the early market seeks out novelty, whereas the mainstream market just cares if you solve a problem for them.

As a result, a marketing strategy focused on early adopters is bound to look better than what you get later. You can get some limited traffic from PR and targeted advertising from niche communities and media properties. However once you get past this group, the CTRs can drop substantially.

If you’re a SaaS or ecommerce company that’s road-tested your marketing strategy by acquiring limited batches of customers, the problem is that whatever assumptions and projections you make off of this base end up fundamentally skewed positive. If your model indicates that you can acquire customers at $10 and break even within 6 months, it’s not hard for a 30% increase in CAC and 30% decrease in LTV to double the time it takes to get to profitability. This could be the difference between life and death for a company.

Lesson to investors is: Beware marketing metrics done at a small scale, and beware marketing tech companies that facilitate momentary marketing opportunities without a bigger vision. These are arbitrage opportunities that will disappear over time.

How to fight the Law of Shitty Clickthroughs
I call it a Law, of course, because I really believe it’s a strong gravitational pull on all marketing on the web. You can’t avoid it, and in many ways, it’s counter productive to try.

You can always get incrementally better performance out of your marketing by taking a nomad strategy – always keep developing new creative, testing new publishers, and so on. That’s all easy, but is mostly about maintaining some base level of performance. This can push the Law of Shitty Clickthroughs to act over years rather than degrading your marketing efforts over months.

Similarly, this law provides a litmus test as to the difference between advertising and information. When you are marketing with useful information, then CTRs stay high. Advertising that’s just novelty and noise wrapped in a new marketing channel has a limited shelf life.

The real solution: Discover the next untapped marketing channel
The 10X solution to solving the Law of Shitty Clickthroughs, even momentarily, is to discover the next untapped marketing channel. In addition to doubling down on traditional forms of online advertising like banners, search, and email, it’s important to work hard to get to the next marketing channel while it’s uncontested.

Sometimes I get asked “have you ever seen someone do XYZ to acquire customers?” Turns out, the highest vote of confidence I can give is, “No I haven’t, and that’s good – that means there’s a higher chance of it working. You should try it.”

Today, these (relatively) uncontested marketing channels are Open Graph, mobile notifications, etc. If you can make these channels work with a strong product behind it, then great. Chances are, you’ll enjoy a few months if not a few years of strong marketing performance before they too, slowly succumb.",
            title: "The Law of Shitty Clickthroughs",
            header: "Welcome to the Law of Shitty Clickthroughs: Over time, all marketing strategies result in shitty clickthrough rates.",
            format: article
          },
          {
            url: "https://andrewchen.co/power-user-curve/",
            content: "<p><em>[Today we have an essay on one of the common frameworks we use to analyze investments at Andreessen Horowitz: The Power User Curve. I worked closely with Li Jin, a partner on the investing team, to collect our ideas into this essay which she wrote. <a href='https://twitter.com/ljin18'>You can follow @ljin18 on Twitter for more thoughts</a>. -Andrew]</em></p>
<p><img class='alignnone size-full wp-image-4258' src='http://1g1uem2nc4jy1gzhn943ro0gz50-wpengine.netdna-ssl.com/wp-content/uploads/2018/07/The-Power-User-Curve-1.png' alt='' width='600' height='200' srcset='https://1g1uem2nc4jy1gzhn943ro0gz50-wpengine.netdna-ssl.com/wp-content/uploads/2018/07/The-Power-User-Curve-1.png 600w, https://1g1uem2nc4jy1gzhn943ro0gz50-wpengine.netdna-ssl.com/wp-content/uploads/2018/07/The-Power-User-Curve-1-300x100.png 300w' sizes='(max-width: 600px) 100vw, 600px' /></p>
<p><strong>The importance of power users</strong><br />
Power users drive some of the most successful companies &#8212; people who love their product, are highly engaged, and contribute a ton of value to the network. In ecommerce marketplaces it’s power sellers, in ridesharing platforms it’s power riders, and in social networks it’s influencers.</p>
<p><span style='font-weight: 400;'>All companies want more power users, but you need to measure them before you can find (and retain) them. While DAU/MAU &#8212; dividing daily active users (DAUs) by monthly active users (MAUs or monthly actives) &#8212; is a common metric for measuring engagement,</span> <a href='https://andrewchen.co/dau-mau-is-an-important-metric-but-heres-where-it-fails/'>it has its shortcomings</a>.</p>
<p>Since companies need a richer and more nuanced way to understand user engagement, we’re going to introduce what we&#8217;ll call the “Power User Curve” &#8212; also commonly called the activity histogram or the &#8220;L30&#8221; (coined by the Facebook growth team). It’s a histogram of users’ engagement by the total number of days they were active in a month, from 1 day out of the month to all 30 (or 28, or 31) days. While typically reflecting top-level activity like app opens or logins, it can be customized for whatever action you decide is important to measure for your product.</p>
<p>The Power User Curve has a number of advantages over DAU/MAU:</p>
<ul>
<li>It shows if you have a hardcore, engaged segment that’s coming back every day.</li>
<li>It shows the variability among your users: some are slightly engaged, whereas others are power users. Contrast this with DAU/MAU: it’s a single number and so blurs this variance.</li>
<li>When mapped to cohorts, Power User Curves let you see if your engagement is getting better over time &#8212; which in turn helps assess product launches and performance of other feature changes.</li>
<li>Power User Curves can be shown for different user actions, not just app opens. This matters if the core activity that matters for your product is deeper in the funnel.</li>
</ul>
<p>In other words, while the DAU/MAU gives you a single number, the Power User Curve gives entrepreneurs several avenues of analysis to assess their product&#8217;s engagement to the most addicted users &#8212; in a single snapshot, over time, and also in relation to monetization. This is useful. So how does it work?</p>
<p><strong>The Power User Curve will &#8220;smile&#8221; when things are good<br />
</strong>The shape of the Power User Curve can be left-leaning or smile-like, all of which means different things. Here&#8217;s a smile:</p>
<p><img class='alignnone wp-image-4259' src='http://1g1uem2nc4jy1gzhn943ro0gz50-wpengine.netdna-ssl.com/wp-content/uploads/2018/07/Screenshot-2018-07-29-at-6.58.48-PM.png' alt=' width='600' height='379' srcset='https://1g1uem2nc4jy1gzhn943ro0gz50-wpengine.netdna-ssl.com/wp-content/uploads/2018/07/Screenshot-2018-07-29-at-6.58.48-PM.png 797w, https://1g1uem2nc4jy1gzhn943ro0gz50-wpengine.netdna-ssl.com/wp-content/uploads/2018/07/Screenshot-2018-07-29-at-6.58.48-PM-300x189.png 300w, https://1g1uem2nc4jy1gzhn943ro0gz50-wpengine.netdna-ssl.com/wp-content/uploads/2018/07/Screenshot-2018-07-29-at-6.58.48-PM-768x485.png 768w' sizes='(max-width: 600px) 100vw, 600px' /></p>
<p>The Power User Curve above is for a social product, and shows the characteristic smile shape that indicates there’s a group of highly engaged users using the app daily or nearly daily. Social products with frequent user engagement like this lend themselves well to monetization via ads—there&#8217;s enough users returning frequently that the impressions can support an ad business. Remember that Facebook would have a very right-leaning smile, with 60%+ of its MAUs coming back daily.</p>",
            title: "The Power User Curve: The best way to understand your most engaged users",
            header: "Power users drive some of the most successful companies — people who love their product, are highly engaged, and contribute a ton of value to the network.",
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
            content: "Growth is one of the most top of mind questions for entrepreneurs building startups of all kinds (and especially consumer ones) — but how does one go beyond a mindset of “growth hacking” to thinking about growth more systemically and holistically? What are the key metrics to know; why; and how?",
            title: "The Basics of Growth 1 -- User Acquisition",
            header: "This episode of the a16z Podcast — one of two in a series — focuses on the user acquisition aspect of growth, followed by engagement and retention in the next episode.",
            format: podcast
          },
          {
            url: "https://embed.simplecast.com/81994ef7?noborder&color=3d3d3d",
            content: "In this episode we talk about:

The uniqueness of the Silicon Valley tech ecosystem, how network effects conspire to create a “rich get richer” situation for cities, and why new communication tools enabling distributed teams to work together across continents could mean that there will be no “next Silicon Valley.”
Ada shares her insights on the contrasting skill sets needed when working at a big company versus a small startup, after having herself gone from a small startup to a huge organization like LinkedIn back to a two-person startup with her husband.
How to port the concept of OKRs — objectives and key results, a personnel management framework originated by legendary Intel CEO Andy Grove — to your personal life from your business (and why you would want to). We talk about you can use them to help manage your exercise, social life and relationship with your SO.
Of course, we also chat about some of their favorite products, including an app that lets you pop in to a luxury hotel for a few hours to shower or have a nap, a super cool way to greet visitors to your office, and a new app for emailing yourself.",
            title: "Mullet startups and how Silicon Valley has changed",
            header: "Today on Product Hunt Radio, I make the trek from San Francisco down to Sandhill Road to talk to Andrew Chen and Ada Chen at Andreessen Horowitz.",
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
            header: "Andrew Chen is one of Silicon Valley's thought leaders on growth, mobile, and startups in general.",
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
            content: "Stop and think for a moment about how many ads you saw in the last 24 hours, on Instagram or Facebook or anywhere else. How many did you scroll through and glaze over? What if the number was capped at 2 or 3 a day? How would that change how you felt about the platform? Similarly, think about how many subscriptions you’ve signed up for—or forgot to cancel. What if, at the point of purchase, you had the option to only buy what you wanted, for the time frame you specified? This type of consumer power is the reality for netizens in China today—because Chinese internet companies have adopted business models that are drastically different than what we see here in the States, especially on mobile.

Product success is not just about having a good product, but also having the right business model(s). Expanding sources of revenue pushes us to think beyond what we know, and creates the infrastructure that opens up new opportunities. In this post, I will use consumer entertainment apps (books, podcasts, videos, and music) as a lens into the different business models and product strategies of Chinese companies. Thinking about content consumption in a mobile-first way in China has enabled these new business models, which not only provide diversified revenue streams for businesses, but also allow users to make better, more flexible purchasing decisions. \n
State of Affairs in the US
In the last decade, large consumer Internet companies from Google and Pinterest to Lyft and Spotify have become household names with market caps in the hundreds of billions of dollars. And yet, in terms of how these hugely successful companies monetize, these companies’ revenue streams are interestingly not very diverse. In fact, they generally fall into one of two buckets: advertising-driven, or transaction/subscription-driven. Revenue is heavily concentrated in one of these two business models, which in turn drives how the companies think about creating product. For example, advertising-driven companies focus on increasing engagement and time in app; transaction-driven services optimize for the lowest friction before checkout. \n
Put simply, apps in the United States are part of either the eyeball economy or part of the wallet economy.



It’s great for a company to focus, but is such a singular focus on one model for a revenue stream the best long term strategy for growth? And perhaps more importantly, does this lead to the best product for customers?

There are extremely compelling reasons to consider diversified revenue streams. Expanding revenue beyond ads allows for the simple fact that people’s preferences change. Digital marketing experts estimate that Americans are exposed to around 4,000 to 10,000 ads daily. There is a point where you can no longer stuff more ads down a consumer’s throat; ads become less effective and more annoying. Over time consumers may also not feel comfortable always being forced to pay for a ‘buffet’ with subscriptions, when in fact they only want one item on the menu.

There are also very strong reasons for combining the advertising centric world and the transaction world. Imagine if, as an advertising company, all of your ads could become one-click transactions: a win-win for advertisers, users, and the platform. If you are a transaction or subscription company, adding content and finding ways for users to increase time on your site leads to more mindshare and lower customer acquisition costs when expanding business lines.

What do these new business models look like?
Largely because many people could not afford a computer, China skipped the PC and the credit card; smartphones were the way many people were exposed to the Internet for the first time. So today, products aren’t just mobile first, many are mobile only. Mobile payments have penetrated the country and China has become a seamless digital society.

In part because a mobile ad is much more annoying on a small screen, the emphasis on advertising vs. other revenue streams is very different in China today than it is in the US. Due to the heightened competitive environment in China, platforms can not afford to not simultaneously seek alternative revenue streams and find ways to monetize without harming the user experience. Take Tencent, for example — a consumer internet company with skyrocketing revenue and a very diversified revenue stream — cloud/payments revenue is up 105% YOY; value added services for social networks are growing by 47%; and less than 20% of their revenue is from advertising. “We should not be overloading our users with ads,” said Tencent President Martin Lau in the Q1 earning call last year. As a result, ads in WeChat Moments (the equivalent to the FB newsfeed) are limited to just two per day. Tencent is able to hold that line on user experience because it has other ways of monetization. It’s hard to argue that the end result is not a better user experience.

As the products have got more sophisticated on mobile, business models with diversified revenue streams for content consumption — that rely neither solely on advertising nor transactions — evolved as well. This post will address four different content categories, with different consumer app sectors as case studies that illustrate not only how different the business models are, but also how the business models result in unique and ultimately better consumer experiences.

  Books
  In the United States, we typically buy digital books on Amazon’s website as one of several purchase options, in the same checkout flow as ordinary purchases.



  In China, books are consumed very differently. In addition to their paid subscription service (similar to Kindle Unlimited), there are three main business models for book-selling in QQ Reading:

  Paid books allow readers access of up to ⅔ of the book for free. Readers have time to get hooked before they need to pay to unlock the ending. Think about how many more books you’d start if this were the case in the States!
  Books are also sold as bite-sized snacks. Readers pay per 1,000 words, for often-serialized works. Below is a screenshot of one of the most popular books from 2014, 一世倾城. It has over 10,000 chapters and is still being updated — now more than 46 times the length of the entire Harry Potter series. Because authors can publish chapters piecemeal, they are also able to incorporate reader feedback to quickly change plots or even kill off characters.


  Some authors offer free books and illustrations, gain a loyal user base, and then collect money through tips. At the end of each chapter, an overlay button for tipping authors allows readers to tip from $0.15 and up.


  Social elements and gamification also are combined to create a more enticing user experience. In WeRead, another one of China Literature’s reading apps, users compete against their WeChat friends on a weekly leaderboard showing who has read for the most time. It’s not just for bragging rights; users earn credits for every 30 minutes they read to spend on more books.

  Search is also a much more complex and refined function in China, going far beyond best-sellers or sort-by-categories with granular, multivariable, smarter search options. Search is about discovery, after all — and the Chinese book platforms find ways to convey more information to customers, so they can find precisely what they want to read however they want to pay for it. For example, users can filter according to male or female readership, physical publications, or audiobooks. Then users can view custom curated lists including top trending, top new, top annual, most searches, free books with the most tips, and even according to times read cover-to-cover. These lists can be sorted weekly, monthly, or overall.

  Importantly, in China, these book platforms also combine books from big publishers with books from up and coming self-published authors. So the way books are sold in China compared to the US is a major rethink of the publishing industry as well as a rethink of ebook platforms. In China, purchasing books is not about a one-time transaction for the platforms. There are elements of social media, gamification, and enhanced discovery — ultimately creating an experience that drives more sales. It all seems to be working. In China the ebook industry grew over 35% from 2016 to 2017; the same industry in the same time in the US trended the opposite direction.



  Podcasts
  The podcast Serial was downloaded 40 million times during its first three-month season in October 2014. This wildly successful spin-off of This is American Life likely perhaps earned up to one million dollars in ad revenue, according to the industry standard of $25 per 1,000 downloads. Revenue might even have been lower, as rates were negotiated well before anyone knew how successful the podcast would become.

  Despite being deemed ‘podcasting’s first breakout hit’, revenue couldn’t cover the cost of producing a second season. The host/executive producer Sarah Koenig started asking listeners for donations during episode nine. In less than a week, enough donations poured in to guarantee a sequel, but the fact remains that advertising alone couldn’t support the big budget podcasts’ continued production even for the most successful podcast the US had ever seen.

  The entire podcast market in the US in 2017 was $314 million, all from ads. Estimates for paid podcast in China, on the other hand, are $3-5 billion, and many individual podcasters are multimillionaires. It’s not a difference of talent; it’s a difference in business models.




  In China, many podcasts charge the end customer instead of relying solely on advertising. Some podcasts are part of the platform’s paid subscription service, but users always have the option to pay for podcasts individually. The following screenshot from the popular podcasting app Ximalaya is all about improving the sound of users’ voices. The podcast course is made of over 30 episodes, and costs around $17. The course has over fifteen million listens and has generated over $1 million in revenue.



  Just like digital books, free podcasts are monetized in several ways. Some podcasts rely on sponsorships and ads the way we do in the US, but podcast hosts can also receive tips that are split between podcaster and platform. In the following example, tip options vary from $.30 to $21. This new model means everyone can make money and content creators have more funds to invest in better production and better content; everyone wins.



  The audio platform Dedao (“iGetGet”) essentially takes the MOOC format and applies it to podcasts. Below are two economics professors from Peking University. Xue Zhaofeng, the professor on the left, actually resigned after making $8 million in one year with his economics podcast series. The professor on the right has grossed nearly $5M in sales for her podcasts on financial literacy and wealth management techniques.


  Beyond the scale and business models, what else makes these Chinese podcast platforms different from their Western counterparts? Similar to book platforms, these apps hook users through social elements and gamification. Ximalaya has a leveling concept, where you ‘level up’ by listening or spending money in the app to earn coupons and even limited-time membership to use their paid subscription service. Dedao hosts a social network based around studying, where users can create a public profile and share or compare course notes. Users can also leave public questions or comments at the end of each podcast transcript.



  Studying podcast platforms such as Dedao or Ximalaya give us insight to how the podcast market here in the States can evolve beyond ads, and ultimately put more money in the pockets of our podcast creators. There is an expansive expert network that is untapped and not fully monetized in the States, not due to a lack of talent, but because of overly simplistic business models.

  Video
  In the U.S., this is what users typically see on YouTube when they first click on a video. Monetization is accomplished through pre-roll ads, display ads, and interstitial ads. Ads typically have nothing to do with the content of the video.



  In China, Baidu spinoff iQiyi, one of the bigger video players, uses AI and machine learning to figure out what’s happening in the content, and play relevant advertising. In the following scene of a young professional putting on lipstick, for example, iQiyi serves an ad promoting a makeup brand. This makes product placement ads that much more valuable, and ads in general slightly more acceptable (screenshot from Ad+ Home).



  iQiyi’s business model also goes beyond advertising with many other revenue initiatives. (Sneak peak: advertising is less than 50% of the company’s revenue). iQiyi has over 80 million VIP members, but membership is not an absolute paywall. Instead, members get perks such as discount coupons, no advertisements, and the ability to watch new releases up to 12 episodes faster. Some of the movies on iQiyi are member-exclusives; non-members can watch the first 6 minutes of the film before deciding whether or not to “unlock” the rest of it with a membership or pay à la carte for the movie. VIP membership rewards active users with perks that keep them engaged with the platform and inevitably spend more money.

  VIP memberships also include exclusive access to app skins based on celebrities or popular shows. In the below skin from iQiyi-produced ‘Sing! China’, all of the navigation buttons are replaced with faces of the mentors/judges.



  On iQiyi, users can clip digital coupons, such as the following BOGO coupons for Dairy Queen and Burger King. Imagine watching a movie on YouTube and getting a craving for pizza and hot wings, now you can immediately act on that craving.



  This is what the watch screen on iQiyi looks like. There’s live comments, sharing for prizes, GIF creation, and even the ability to top up your mobile data plan. Users are even upsold their VIP membership in order to access the higher quality audio and video. You could say this is too crowded of a page; you could also argue that this is a more advanced experience, where you can even create content to share on social media. If it’s too busy for you, all you have to do is tap to hide the settings overlay.



  For many shows or movies, users can shop related items as they continue to watch; there is no need to stop the video. Rap of China viewers can buy Beats headsets as they watch, while users watching ‘The Great Wall’ movie can purchase custom movie merchandise while they’re engrossed in the film.

  There’s even a social network component that lives entirely inside iQiyi. Users can join their favorite celebrities fan circles to chat about the latest celebrity news and gossip. The platform is a rich aggregate of content and can be used as a portal to watch shows, movies, social media, view upcoming meet and greet events, and even read news.



  This social network that lives inside iQiyi is not just for celebrity news; there are more than one hundred fan circles based on iQiyi’s most popular content and all topics related to entertainment. In turn, the information from the social network gives iQiyi data on how to cast characters, evaluate scripts, and even predict show success. The social network increases app opens by 160%, and average daily watch time by 24%.

  iQiyi’s business model has also extended to the real world with its recent launch of ‘on-demand movie theatres.’ These miniature theatres range from two to ten seats, and are rentable by the hour to watch any content from iQiyi’s library. It’s bringing the traditional movie theatre experience up to date in the era of streaming.

  The result of iQiyi’s expansive business model is a diverse product strategy and diverse revenue streams.The below graph depicts the 1H18 revenue distribution, with membership and advertising in a dead heat.



  However, this race did not stay even for long. In 3Q18, membership stayed steady at 41.2% of revenue, while advertising dropped to 34.6%.  iQiyi has over 80 million paying members out of over 500 million total users, and is able to successfully monetize all users because of its expansive business model and emphasis on diversified revenue.

  Music
  In the US, we’re used to a monthly subscription fee on Spotify or free online radio where we listen to ads every so often. What happens when you take a music streaming platform and turn it into a social, lifestyle app?

  Tencent Music illustrates very well the extent to which Chinese music industry has rethought the entire business model. For starters, popular artists often have a limited-time streaming block on new releases. During this time period, users buy or gift virtual albums that provide exclusive access. Two years ago, pop singer Jay Chou sold limited time access to his album Bedtime Stories for less than $3. To promote competition among fans, Tencent Music created a leaderboard showing how many times fans purchased the album; the top user purchased the album over 400 times!



  But you don’t have to top the leaderboards to get the benefits here. Say you bought that Jay Chou album 3 times; you might be ranked #3913 on the leaderboard, but worry not, you’ve also won 3 raffle tickets to win signed posters, VIP memberships, or even Jay Chou sleeping masks. This kind of gamification and reward system turns average fans into superfans, and gives superfans a deeper connection to the artists they adore.



  The Tencent Music platform has multiple such methods of increasing fan loyalty and improving artist marketing for artists big and small. Similar to iQiyi, users can skin the app for a small fee. You can imagine how many Deadheads, Beliebers or Swifties here in the States might also be willing to pay a small fee to skin their media apps.

  There is also a social network where small or medium artists can post articles, and fans can access news, music videos, and behind the scenes content. Artists are able to share more of their story and fans develop deeper loyalty. Artists simply don’t get this kind of fan support from Western music platforms.

  If your interest is in live music, Tencent Music apps also have a feature for that. The app strives to be a hub for concerts and events so you can buy concert tickets directly within the app. If you can’t attend concerts in person, you can also watch live streams. In the screenshot below, the live stream concert by TFBOYS was watched over 36 million times.



  In Tencent Music, there are leaderboards for gamification, social radio and singing, live concerts, and even a TMZ-type portal for discovery. In short, there are many ways for listeners to engage with music and the artists. But perhaps the biggest difference of all is that the company’s focus is not just listening and consuming music, but also creating content and allowing users to earn money. Anyone can create an online radio station within the music app and curate their own playlist. Hosts tell stories between songs, or give commentary on the lyrics. Good hosts earn tips in the form of digital gifts from listeners and get to keep 30% of the revenue.


  In Tencent Music’s other flagship app, WeSing, users can livestream their own karaoke room or open up the floor to anyone who wants to sing karaoke. Singers keep 30% of the tip revenue. It’s fun, social, and makes a lot of money for both platform and customer.



  Lastly, Tencent Music is also taking its business offline. The company is not only selling microphones and headphones, but also opening up hundreds of mini karaoke booths in malls. They come complete with chairs, curtains, headsets, even air conditioning. Users have a blast in the booth, and then get a recording of the singing sent to their phone. (Image below of competitor Minik’s karaoke booth from journalist Zhang Cenyu).



  The result of such a nuanced business model is a whopping 70% of revenue comes from those live streaming services – tips for radio and karaoke. It’s a complete contrast from Spotify’s business model, of which 90% of revenue comes from subscriptions. All in all, Tencent Music’s business model transforms music from a solo consumption product to a lifestyle, sharable experience.



  Where is the US headed?
  Finding new ways to diversify revenue streams in China has led to very interesting product innovation for these companies. We are just beginning to see the same kind of thinking in the US. Amazon is one of my favorite examples. As Amazon dives more into content and advertisements, its ability to sell ads against viewer’s past purchases make their ads tremendously valuable. For instance, imagine Coca-Cola now being able to serve ads only to people who purchased Pepsi.




  CEO/Founder of Buzzfeed Jonah Peretti (an a16z portfolio company) understands this shift. “We’ve outgrown the ability to build our business on essentially a single, very distinct revenue stream,” Peretti recently said. Buzzfeed — historically a media business that delivers news and makes money from ads —  announced their push to diversify in late 2017. They’ve partnered with Walmart and Jet to sell branded kitchenware in a seamless purchase experience.

  Their new business model is a 3×3 grid (below) in which Buzzfeed and related brands profit from three core revenue streams: advertising, commerce, and video entertainment. Jonah predicted that by 2019, half of the company’s revenue will come from outside of ads.



  Going beyond “only”
  In the past, revenue was often thought of as a result of product brilliance. Studying China illustrates how expanding sources of revenue, not just growing existing revenue lines, is a lens to drive product thinking. This idea of going beyond ads-only and transactions-only to diversify revenue streams can be applied to all kinds of sectors. Just think about some of the following ways in which we can adapt or integrate business models for the future: ads to subsidize ride sharing; live streaming, influencer reviews, and limited-time promos to drive e-commerce; gamification to promote healthier lifestyles. How much more fun could products and services be if they branched away from a singular business model?

  History has taught us that not all established companies can make business model transitions. Will the current set of Internet companies make this leap to more personalized user experiences that are less ad- or transaction-centric? Perhaps, given all of this, FAANG could be more vulnerable than many think.

  Expanding sources of revenue not only pushes us to think beyond what we know, but forces us to create the infrastructure to go after new opportunities. After all, revenue is simply a proxy for how you are serving your customers. As you diversify and experiment in generating revenue in new ways, you are effectively honing in on your ability to give customers what they want, how they want it.



  Business models as a product strategy. It’s exciting to imagine what’s possible when advertising and transactions collide.

  Thanks to Avery Segal for his research help.",

            title: "Outgrowing Advertising: Multimodal Business Models as a Product Strategy",
            header: "Stop and think for a moment about how many ads you saw in the last 24 hours, on Instagram or Facebook or anywhere else. How many did you scroll through and glaze over? What if the number was capped at 2 or 3 a day? How would that change how you felt about the platform?",
            format: article
          },
          {
            url: "https://a16z.com/2018/12/07/when-advertising-isnt-enough-multimodal-business-models-product-strategy/",
            content: "There’s a new era of AI consumer-based apps spreading around the world, though starting from China.

TikTok, a short-form mobile video app, was downloaded on Apple’s App store more than 104 million times during the first half of 2018 — making it the world’s most downloaded app in that period. In fact, installs in the United States in the month of October [or more specifically, between 09/29/18-10/30/18] were higher than Facebook, Instagram, Snapchat, and YouTube, reaching a whopping 42.4% of downloads among those already popular apps. Yet much of the coverage on TikTok either compares it to Facebook’s direct competitor (Lasso), or incorrectly labels it as a lip sync app for teenagers. It’s more.

Not only is TikTok a China-based company whose product is winning hearts in the U.S. and around the world, it is, more importantly the first mainstream consumer app where artificial intelligence IS the product (I argue why below). It’s representative of a broader shift, where AI is transitioning from the discovery phase to the implementation phase.

So what happens when AI research comes to life in a mass-market consumer app? In this post, we’ll examine three examples of consumer apps, originally from China (though TikTok is already used beyond China) that are really drawing on AI to reshape product, provide trust in anonymity (yes!), and unlock massive cost savings and accessibility. AI is not a feature, but the product… and this phenomenon will spread around the world.

AI consumer app example #1: TikTok, and why it matters
Often misclassified as a lip sync platform based off its predecessor Musical.ly, TikTok is a mobile app that displays full screen short videos — a max of 60 seconds — and uses AI to personalize the user’s video feed. Clips play continuously, and users can swipe up if they want to skip ahead; there’s also commenting, liking, and the early seeds of a stranger-to-stranger social network. Recently, TikTok partnered with the NBA to show behind-the-scenes footage and highlights, as well as showcase celebrities (including Jimmy Fallon and Cardi B) to create fun “challenges” for community engagement.

It’s like TV, but without a remote control — thanks to AI
TikTok is fully reliant on AI, and that makes all the difference. Rather than asking users to tap into a video thumbnail or click into a channel, the app’s AI algorithms decide which videos to show users. The full-screen design of TikTok allows every video to unveil both positive and negative signals from users (positive = a like, follow, or watching until the end; negative = swipe away, press down). Even the speed at which users swipe a video away is a relevant signal.

Instagram, on the other hand, uses AI as a tool instead of the actual product. Although AI helps determine the recommended videos shown in one’s Instagram’s explore feed, the thumbnail presentation gives the platform less clear signaling of likes and dislikes. If someone didn’t click into a thumbnail, is it really because they wouldn’t like that video?

How is this different than platforms and products like Facebook news feed, Netflix, Spotify, and YouTube, which all also famously use recommendation algorithms to users on what to pay attention to (whether news, shows, music, or videos)? I’d argue that the approach that the apps mentioned in this post take a more AI-centric approach, each in different ways. TikTok, for example, never presents a list of recommendations to the user (like Netflix and YouTube do), and never asks the user to explicitly express intent — the platform infers and decides entirely what the user should watch.

This may be a matter of degree not just kind, but I’d also argue that even seemingly small differences shouldn’t be underestimated: Who thought disappearing stories would change so much of social networking as we know it? By taking such a fully AI-reliant approach, TikTok users are more likely to see short videos of topics they would never explicitly search or express interest in on YouTube (e.g., of manufacturing lines), opening up new routes to serendipitous discovery.

A broad talent and content pool
The diversity of content in TikTok is as wide as YouTube, with TikTok users competing to push the boundaries of what’s possible with short clips. Music and lip syncing is a portion of the content, but so is artwork, cookie-decorating, hair tutorials, DIY science experiments, jokes, and video memes that allow users to add their own twist to preexisting songs and videos. This format lowers the barrier to entry for content creation, facilitates a sense of shared community among users, and does not require a large song selection. Some musicians have also enjoyed broader promotion and distribution from TikTok memes: In the case of Deep Chills, the creator of the music clip behind #shoechange, his song has been used to create over 5.5 million videos.

15 seconds of fame
Since most TikTok videos are 15 seconds today, creators don’t need to speak, and some don’t even show their face. This allows a whole new crop of creators that would not succeed on YouTube and Instagram to find their internet followings, expressing themselves in new ways. Additionally, the lack of “voice” means a fair amount of platform content has global appeal without requiring translation. The short length also requires videos to be entertaining at the get-go, providing instant gratification and habit-forming predictability for users, as well as the incentive to keep trying new genres of content.

The Happy Place
Because TikTok completely controls what users see, and uses AI to do so, it can optimize the video feed for user happiness. The platform can decide to show videos that are upbeat, funny, and/or wholesome — in fact, the entire vibe of the platform is largely under TikTok’s control because they, not users, decide which videos to display. Even if a user subscribes to a creator, there is no guarantee that he/she will see all of the creator’s videos. This product design ups the ante for the platform’s algorithms because a series of misses will cause users to close the app. Unlike other social networks where communication is part of the core value proposition, if a user stops using the U.S. version of TikTok, it is harder for TikTok to win him/her back.

A Trojan horse to social networking?
Just as the U.S. version of WeChat only showcases a subset of the app’s functionality, TikTok only has a subset of the features of its sister app in China, 抖音 (“Douyin”), which is more social. Instead of a dedicated notifications tab, Douyin has a news tab which is primarily a messaging inbox. Since videos in Douyin can be sorted by city, the introduction of messaging allows the platform to facilitate friendships in real life. Furthermore, a larger focus on livestreaming and ecommerce give creators financial incentives to broadcast and create great content through these mechanisms. So, it will be interesting to see how TikTok evolves on the social front.

TikTok is the first mainstream consumer app where artificial intelligence IS the product. It’s representative of a broader shift.

…It all comes down to AI
Because TikTok’s success hinges on the strength of its algorithms — it is not easy to otherwise curate hundreds of unique videos everyday for each user — the format of short UGC video, viewed on mobile, paired with AI personalized recommendations has created a sticky platform with global appeal. In China, daily use time is 31 minutes (over 120 videos); in the U.S., monthly usage in October 2018 was 6.8 hours.

More broadly, I believe TikTok’s rise signals a new era of AI consumer apps. Not only can the learnings from TikTok be applied to a vast range of consumer behavior — reading news, listening to music, making purchases — but also Chinese entrepreneurs are already applying learnings to new categories such as dating, learning, and recruiting. In the same way WeChat ushered in the era of “super apps“, TikTok’s parent company Bytedance is ushering in the era of AI consumer apps. But there’s more, beyond TikTok…

AI consumer app example #2: Soul, bringing back anonymity
In an ideal world, building relationships would be based on complementary personalities, interests, and values — and Soul, a more recently popular app in China, uses AI and anonymity as the cornerstones for facilitating such relationships. Popular use cases range from wanting to just talk or vent anonymously, to finding new friends and soulmates. As of May 2018, Soul had over 3.5 million MAUs.

When users join Soul, they answer a six-question quiz (with 50 optional further questions if so desired) with binary answers that serve as the baseline for the app’s AI matching algorithms:

Would you prefer to be seen as firm or tenderhearted?
Are you better at helping close friends understand emotions or making logical decisions?
What is more important in conversations: maintaining interpersonal connections or reaching agreements?
In your work, which do you display more: enthusiasm or perfectionism?
Do you often forget trivial chores?
Which better describes your life goal: seizing life’s opportunities to capture its brilliance or searching for the meaning and essence of life?
Once the quiz is completed, users are eligible to be matched and can choose to have a conversation with strangers via text or audio. Most importantly: no real names, photos, or even quiz answers are revealed — users actually have the option of changing their voice, and there’s even a paper bag that conceals the avatar heads! AI drives the matching algorithm based on at least an 85% compatibility score.



Chats begin immediately when two strangers are paired, and users are given suggestions on what to talk about. Either user can end the chat at any time, and after three minutes, both parties must decide whether or not to reveal their usernames to continue the conversation. The platform has full visibility into when and why the conversation fell apart.

It’s as if a dating service got to listen in on your first date and use that information to find your next match.

By using AI to generate matches, Soul also gives users more confidence that their matches are not random and have a decent chance of success. In other words, AI helps restore trust in anonymous chats. Soul’s approach has other benefits as well; for instance, by stripping the experience of video and relying only on voice and messaging, interactions are not based on physical attraction, so rejection is taken less personally. (After all, maybe the platform just made a bad match!)

The app draws parallels to Chatroulette, of which one in eight matches has questionable content. But on a platform molded with AI, “questionable” users are either weeded out or only matched with other users that they’re likely to still have a shot with. Soul’s popularity demonstrates how an AI approach can give new life to an old consumer app idea. How many other failed business models could be revisited with an AI strategy today?

AI consumer app example #3: LingoChamp, providing affordable education
Imagine an English tutor that can give you feedback on pronunciation, grammar, vocabulary and overall fluency — that kind of 1:1 tutor could easily cost upwards of $40/hour in first-tier Chinese cities. But LingoChamp is an AI English tutoring app that charges users $14/month for unlimited access to tests, courses, and personalized curriculum. In Q3 2018, the app had 97 million total users with over 870,000 paying customers (158% growth YOY) — the equivalent of $26.3 million in net revenue and 73.4% gross margins.

Users start by selecting level of schooling; purpose for using the app (international business, travel, karaoke, watching movies, IELTS exam, study abroad, etc.); and then they complete an assessment exam. Once the users’ level is determined, they can take bite-sized courses on how to say hi to foreigners or how to ask for employee benefits, or simply reading a children’s storybook. The platform gives users audio playback of any mistakes as well as smart analysis and suggestions for improvement.

LingoChamp therefore has the world’s largest dedicated database (as of Q2 2018) of English spoken by Chinese at various proficiency levels — it has trained its AI model with over 1.3 billion minutes of conversation and 17.5 billion sentences. Lingochamp then uses this data to predict user success and tailor questions to be challenging, but not discouraging. Finally, LingoChamp’s parent company LAIX also offers a free International English Language Testing System (IELTS) exam app that uses their AI engine to give advanced feedback for practice exams.

All this data, combined with AI, provides the company’s moat against competitors. According to iResearch, China’s AI-powered online education market reached approximately $568 million in 2017 and is expected to surpass $26 billion in 2022 overall. But the bigger picture here is about AI enabling scale and access: In a country where there’s a huge deficit of English teachers (70% of primary and secondary schools in Yunnan province alone lack English teachers), the app is not just making English learning orders of magnitude cheaper, but truly more accessible to all. As founder Yi Wang observes, “The variable cost is so low that it’s negligible. This is a whole new model of really pushing the boundary of human learning forward.”

Imagine how such AI knowledge sharing could be extended beyond English tutoring. As such, AI is a cost-effective solution to scaling education to make it both accessible and inclusive.

How many other failed business models could be revisited with an AI strategy today?

*   *   *

These are just three examples — for short video, anonymous chat, and English learning — of AI consumer apps. Other examples include Boss Zhipin and VIP Peilian: the former uses AI to match job applicants and employers, optimizing its recommendations to increase the chances of an applicant landing a job; and the latter uses AI for music education, evaluating how each song is played based on pitch and rhythm. Because both apps use an AI-driven approach, the app (in the case of Boss Zhipin) can recommend a long tail of potential employers, and the app can also (in the case of VIP Peilian) be much cheaper — a fraction of the cost of an in-person instructor.

What all these apps show is the earliest innings of a new wave of consumer startups where AI is the product. Everyone talks about TikTok — and Toutiao, China’s leading news app that uses AI to deliver a personalized feed to each of its users (both created by the same company) — but the question we should ask ourselves is not whether these apps stay at the top, but what other problems for consumer behavior can AI solve?

In his recent book AI Superpowers, former NLP researcher/ technologist Kai-Fu Lee argues that “Much of the difficult but abstract work of AI research has been done, and it’s now time for entrepreneurs to roll up their sleeves and get down to the dirty work of turning algorithms into sustainable businesses.” But as I’ve outlined in this post, the implementation phase has already begun. So what’s coming next in this new era of Consumer AI apps?",

            title: "When AI is the Product: The Rise of AI-Based Consumer Apps",
            header: "There’s a new era of AI consumer-based apps spreading around the world, though starting from China.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://a16z.com/2017/04/24/to-f8-and-beyond/",
        platform: external_blog,
        media: [
          {
            url: "https://soundcloud.com/a16z/to-f8-and-beyond",
            content: nil,
            title: "Connie Chan and Andrew Chen: QR. AR. VR. ",
            header: "As online platforms built on “real” identity and brands bring more of the real world into the digital realm, will we experience filter fatigue… or will the mundane become more profound?",
            format: podcast
          }
        ]
      }
    ]
  },

  # Influencer 6 : Marc Andreessen

  {
    name: 'Marc Andreessen',
    bio: "Marc Andreessen is a cofounder and general partner of the venture capital firm Andreessen Horowitz. Marc co-created the highly influential Mosaic Internet browser and co-founded Netscape, which later sold to AOL for $4.2 billion.",
    accounts: [
      {
        username: nil,
        url:"http://blog.pmarca.com/",
        platform: blog,
        media: [
          {
           url: "https://a16z.com/2011/08/20/why-software-is-eating-the-world/",
           content: "This week, Hewlett-Packard (where I am on the board) announced that it is exploring jettisoning its struggling PC business in favor of investing more heavily in software, where it sees better potential for growth. Meanwhile, Google plans to buy up the cellphone handset maker Motorola Mobility. Both moves surprised the tech world. But both moves are also in line with a trend I’ve observed, one that makes me optimistic about the future growth of the American and world economies, despite the recent turmoil in the stock market.

In short, software is eating the world.

More than 10 years after the peak of the 1990s dot-com bubble, a dozen or so new Internet companies like Facebook and Twitter are sparking controversy in Silicon Valley, due to their rapidly growing private market valuations, and even the occasional successful IPO. With scars from the heyday of Webvan and Pets.com still fresh in the investor psyche, people are asking, “Isn’t this just a dangerous new bubble?”

I, along with others, have been arguing the other side of the case. (I am co-founder and general partner of venture capital firm Andreessen-Horowitz, which has invested in Facebook, Groupon, Skype, Twitter, Zynga, and Foursquare, among others. I am also personally an investor in LinkedIn.) We believe that many of the prominent new Internet companies are building real, high-growth, high-margin, highly defensible businesses.

Today’s stock market actually hates technology, as shown by all-time low price/earnings ratios for major public technology companies. Apple, for example, has a P/E ratio of around 15.2 — about the same as the broader stock market, despite Apple’s immense profitability and dominant market position (Apple in the last couple weeks became the biggest company in America, judged by market capitalization, surpassing Exxon Mobil). And, perhaps most telling, you can’t have a bubble when people are constantly screaming “Bubble!”

But too much of the debate is still around financial valuation, as opposed to the underlying intrinsic value of the best of Silicon Valley’s new companies. My own theory is that we are in the middle of a dramatic and broad technological and economic shift in which software companies are poised to take over large swathes of the economy.

More and more major businesses and industries are being run on software and delivered as online services — from movies to agriculture to national defense. Many of the winners are Silicon Valley-style entrepreneurial technology companies that are invading and overturning established industry structures. Over the next 10 years, I expect many more industries to be disrupted by software, with new world-beating Silicon Valley companies doing the disruption in more cases than not.

Why is this happening now?

Six decades into the computer revolution, four decades since the invention of the microprocessor, and two decades into the rise of the modern Internet, all of the technology required to transform industries through software finally works and can be widely delivered at global scale.

Over two billion people now use the broadband Internet, up from perhaps 50 million a decade ago, when I was at Netscape, the company I co-founded. In the next 10 years, I expect at least five billion people worldwide to own smartphones, giving every individual with such a phone instant access to the full power of the Internet, every moment of every day.

On the back end, software programming tools and Internet-based services make it easy to launch new global software-powered start-ups in many industries — without the need to invest in new infrastructure and train new employees. In 2000, when my partner Ben Horowitz was CEO of the first cloud computing company, Loudcloud, the cost of a customer running a basic Internet application was approximately $150,000 a month. Running that same application today in Amazon’s cloud costs about $1,500 a month.

With lower start-up costs and a vastly expanded market for online services, the result is a global economy that for the first time will be fully digitally wired — the dream of every cyber-visionary of the early 1990s, finally delivered, a full generation later.

Perhaps the single most dramatic example of this phenomenon of software eating a traditional business is the suicide of Borders and corresponding rise of Amazon. In 2001, Borders agreed to hand over its online business to Amazon under the theory that online book sales were non-strategic and unimportant.

Oops.

Today, the world’s largest bookseller, Amazon, is a software company — its core capability is its amazing software engine for selling virtually everything online, no retail stores necessary. On top of that, while Borders was thrashing in the throes of impending bankruptcy, Amazon rearranged its web site to promote its Kindle digital books over physical books for the first time. Now even the books themselves are software.

Today’s largest video service by number of subscribers is a software company: Netflix. How Netflix eviscerated Blockbuster is an old story, but now other traditional entertainment providers are facing the same threat. Comcast, Time Warner and others are responding by transforming themselves into software companies with efforts such as TV Everywhere, which liberates content from the physical cable and connects it to smartphones and tablets.

Today’s dominant music companies are software companies, too: Apple’s iTunes, Spotify and Pandora. Traditional record labels increasingly exist only to provide those software companies with content. Industry revenue from digital channels totaled $4.6 billion in 2010, growing to 29% of total revenue from 2% in 2004.

Today’s fastest growing entertainment companies are videogame makers — again, software — with the industry growing to $60 billion from $30 billion five years ago. And the fastest growing major videogame company is Zynga (maker of games including FarmVille), which delivers its games entirely online. Zynga’s first-quarter revenues grew to $235 million this year, more than double revenues from a year earlier. Rovio, maker of Angry Birds, is expected to clear $100 million in revenue this year (the company was nearly bankrupt when it debuted the popular game on the iPhone in late 2009). Meanwhile, traditional videogame powerhouses like Electronic Arts and Nintendo have seen revenues stagnate and fall.

The best new movie production company in many decades, Pixar, was a software company. Disney — Disney! — had to buy Pixar, a software company, to remain relevant in animated movies.

Photography, of course, was eaten by software long ago. It’s virtually impossible to buy a mobile phone that doesn’t include a software-powered camera, and photos are uploaded automatically to the Internet for permanent archiving and global sharing. Companies like Shutterfly, Snapfish and Flickr have stepped into Kodak’s place.

Today’s largest direct marketing platform is a software company — Google. Now it’s been joined by Groupon, Living Social, Foursquare and others, which are using software to eat the retail marketing industry. Groupon generated over $700 million in revenue in 2010, after being in business for only two years.

Today’s fastest growing telecom company is Skype, a software company that was just bought by Microsoft for $8.5 billion. CenturyLink, the third largest telecom company in the U.S., with a $20 billion market cap, had 15 million access lines at the end of June 30 –declining at an annual rate of about 7%. Excluding the revenue from its Qwest acquisition, CenturyLink’s revenue from these legacy services declined by more than 11%. Meanwhile, the two biggest telecom companies, AT&T and Verizon, have survived by transforming themselves into software companies, partnering with Apple and other smartphone makers.

LinkedIn is today’s fastest growing recruiting company. For the first time ever, on LinkedIn, employees can maintain their own resumes for recruiters to search in real time — giving LinkedIn the opportunity to eat the lucrative $400 billion recruiting industry.

Software is also eating much of the value chain of industries that are widely viewed as primarily existing in the physical world. In today’s cars, software runs the engines, controls safety features, entertains passengers, guides drivers to destinations and connects each car to mobile, satellite and GPS networks. The days when a car aficionado could repair his or her own car are long past, due primarily to the high software content. The trend toward hybrid and electric vehicles will only accelerate the software shift — electric cars are completely computer controlled. And the creation of software-powered driverless cars is already under way at Google and the major car companies.

Today’s leading real-world retailer, Wal-Mart, uses software to power its logistics and distribution capabilities, which it has used to crush its competition. Likewise for FedEx, which is best thought of as a software network that happens to have trucks, planes and distribution hubs attached. And the success or failure of airlines today and in the future hinges on their ability to price tickets and optimize routes and yields correctly — with software.

Oil and gas companies were early innovators in supercomputing and data visualization and analysis, which are crucial to today’s oil and gas exploration efforts. Agriculture is increasingly powered by software as well, including satellite analysis of soils linked to per-acre seed selection software algorithms.

The financial services industry has been visibly transformed by software over the last 30 years. Practically every financial transaction, from someone buying a cup of coffee to someone trading a trillion dollars of credit default derivatives, is done in software. And many of the leading innovators in financial services are software companies, such as Square, which allows anyone to accept credit card payments with a mobile phone, and PayPal, which generated more than $1 billion in revenue in the second quarter of this year, up 31% over the previous year.

Health care and education, in my view, are next up for fundamental software-based transformation. My venture capital firm is backing aggressive start-ups in both of these gigantic and critical industries. We believe both of these industries, which historically have been highly resistant to entrepreneurial change, are primed for tipping by great new software-centric entrepreneurs.

Even national defense is increasingly software-based. The modern combat soldier is embedded in a web of software that provides intelligence, communications, logistics and weapons guidance. Software-powered drones launch airstrikes without putting human pilots at risk. Intelligence agencies do large-scale data mining with software to uncover and track potential terrorist plots.

Companies in every industry need to assume that a software revolution is coming. This includes even industries that are software-based today. Great incumbent software companies like Oracle and Microsoft are increasingly threatened with irrelevance by new software offerings like Salesforce.com and Android (especially in a world where Google owns a major handset maker).

In some industries, particularly those with a heavy real-world component such as oil and gas, the software revolution is primarily an opportunity for incumbents. But in many industries, new software ideas will result in the rise of new Silicon Valley-style start-ups that invade existing industries with impunity. Over the next 10 years, the battles between incumbents and software-powered insurgents will be epic. Joseph Schumpeter, the economist who coined the term “creative destruction,” would be proud.

And while people watching the values of their 401(k)s bounce up and down the last few weeks might doubt it, this is a profoundly positive story for the American economy, in particular. It’s not an accident that many of the biggest recent technology companies — including Google, Amazon, eBay and more — are American companies. Our combination of great research universities, a pro-risk business culture, deep pools of innovation-seeking equity capital and reliable business and contract law is unprecedented and unparalleled in the world.

Still, we face several challenges.

First of all, every new company today is being built in the face of massive economic headwinds, making the challenge far greater than it was in the relatively benign ’90s. The good news about building a company during times like this is that the companies that do succeed are going to be extremely strong and resilient. And when the economy finally stabilizes, look out — the best of the new companies will grow even faster.

Secondly, many people in the U.S. and around the world lack the education and skills required to participate in the great new companies coming out of the software revolution. This is a tragedy since every company I work with is absolutely starved for talent. Qualified software engineers, managers, marketers and salespeople in Silicon Valley can rack up dozens of high-paying, high-upside job offers any time they want, while national unemployment and underemployment is sky high. This problem is even worse than it looks because many workers in existing industries will be stranded on the wrong side of software-based disruption and may never be able to work in their fields again. There’s no way through this problem other than education, and we have a long way to go.

Finally, the new companies need to prove their worth. They need to build strong cultures, delight their customers, establish their own competitive advantages and, yes, justify their rising valuations. No one should expect building a new high-growth, software-powered company in an established industry to be easy. It’s brutally difficult.

I’m privileged to work with some of the best of the new breed of software companies, and I can tell you they’re really good at what they do. If they perform to my and others’ expectations, they are going to be highly valuable cornerstone companies in the global economy, eating markets far larger than the technology industry has historically been able to pursue.

Instead of constantly questioning their valuations, let’s seek to understand how the new generation of technology companies are doing what they do, what the broader consequences are for businesses and the economy and what we can collectively do to expand the number of innovative new software companies created in the U.S. and around the world.

That’s the big opportunity. I know where I’m putting my money.",
           title: "Why Software Is Eating the World",
           header: "This article was originally published in The Wall Street Journal on August 20, 2011.",
           format: article
          },
          {
           url: "http://blog.pmarca.com/2010/08/02/growing-pains/",
           content: "These days, entrepreneurs spend a lot of time thinking about scaling their products. No one wants to build the next Facebook only to watch their technical infrastructure crumble when user growth takes off.

Entrepreneurs rarely think as much or as deeply or as rigorously about how to scale their companies. Best practices for scaling human organizations are harder to find, and the whole endeavor feels much more like an art than a science.

Ben leaps into this information void with his latest blog post titled Taking the Mystery out of Scaling a Company. This post will be the first of a series Ben will write on this topic because each skill CEOs must learn to scale their companies—such as designing and rolling out re-organizations, hiring functional executives for functions they’ve never done personally, optimizing incentive systems, and so on—need a post (or three) of their own.",
           title: "Growing Pains",
           header: "These days, entrepreneurs spend a lot of time thinking about scaling their products. No one wants to build the next Facebook only to watch their technical infrastructure crumble when user growth takes off.",
           format: article
          },
          {
           url: "https://a16z.com/2014/06/20/what-it-will-take-to-create-the-next-great-silicon-valleys-plural/",
           content: "The popular recipe for creating the “next” Silicon Valley goes something like this: \n

          *Build a big, beautiful, fully equipped technology park;\n
          *Mix in R&D labs and university centers;\\n
          *Provide incentives to attract scientists, firms, and users;\n
          *Interconnect the industry through consortia and specialized suppliers;\n
          *Protect intellectual property and tech transfer; and\n
          *Establish a favorable business environment and regulations.\n

          Except … this approach to innovation clusters hasn’t really worked. Some have even dismissed these government-driven efforts as “modern-day snake oil.” Yet policymakers are always searching for the next Silicon Valley because of the critical link between tech innovation, economic growth, and social opportunity.

          Previous efforts at such clusters failed for a variety of reasons, but one big reason is that government efforts alone simply don’t draw people. That’s why a recent crop of experiments has focused more on building entrepreneurial communities, urban hubs and districts, and hackerspaces. Still, we’re “splitting the logic” on how to create an innovation ecosystem, according to MIT expert Fiona Murray in Technology Review: We’re either going top-down by focusing primarily on infrastructure — plunking down an office park next to a university — or bottom-up by focusing on just the networks. None of these efforts successfully pursue both paths at once, with government, academia and entrepreneurial communities proceeding together in lockstep … as was the case in the development of Silicon Valley.

            But policymakers shouldn’t be trying to copy Silicon Valley. Instead, they should be figuring out what domain is (or could be) specific to their region — and then removing the regulatory hurdles for that particular domain. Because we don’t want 50 Silicon Valleys; we want 50 different variations of Silicon Valley, all unique from each other and all focusing on different domains.

            Imagine a Bitcoin Valley, for instance, where some country fully legalizes cryptocurrencies for all financial functions. Or a Drone Valley, where a particular region removes all legal barriers to flying unmanned aerial vehicles locally. A Driverless Car Valley in a city that allows experimentation with different autonomous car designs, redesigned roadways and safety laws. A Stem Cell Valley. And so on.

            There’s a key difference from the if-you-build-it-they-will-come argument of yore. Here, the focus is more on driving regulatory competition between city, state, and national governments. There are many new categories of innovation out there and entrepreneurs eager to go after opportunities within each of them. Rethinking the regulatory barriers in specific industries would better draw the startups, researchers and divisions of big companies that want to innovate in the vanguard of a particular domain — while also exploring and addressing many of the difficult regulatory issues along the way.

            Why this approach? Compared with previous innovation-cluster efforts where governments contrived to do something unnatural, this proposal flows from what governments naturally do best: create, or rather, relax laws.

            Another advantage of this approach is that it’s a way for clusters to differentiate from each other and successfully compete for resources. Think of it as a sort of “global arbitrage” around permissionless innovation — the freedom to create new technologies without having to ask the powers that be for their blessing. Entrepreneurs can take advantage of the difference between opportunities in different regions, where innovation in a particular domain of interest may be restricted in one region, allowed and encouraged in another, or completely legal in still another.For example, the laws and guidelines for using drones or taxing bitcoin already vary widely across the globe, just as they do for ride-sharing services across different cities in the U.S.

            But the biggest advantage of the 50-different-Silicon Valleys approach isn’t just in what it affords isolated regions or entrepreneurs — it’s in accelerating innovation everywhere. Removing regulations across different regions allows multiple innovation categories to advance together at once, in parallel, without being bottlenecked by time or place.

            So what are the risks? Well, there’s a real possibility that advanced regions will essentially outsource or “regulate away” their own risk at the expense of less advanced ones. To get ahead, poorer countries may become more tempted to take on the very things wealthier countries are fencing out of their borders. But as long as the innovations aren’t life-threatening — and many of the restricted domains aren’t (the restrictions are often protecting incumbent interests) — a model like this one provides a much faster and more feasible way for developing regions to catch up. Especially when you consider the advantage that previous innovation clusters didn’t have: mobile.

            With 5.9 billion smartphone users coming online in five years — largely due to the developing world — mobile acts not just as a leveler, but as a multiplier. As Tim Worstall argues:

            One way of thinking about economic growth…is that it’s all about the adoption of new technologies of production. We could say that the introduction of electricity was itself economic growth, or that the adoption of smartphones will be. However, they’re both multiplying technologies: electricity allows more work to be done by replacing muscle power and, through light, enables work or study to be done for more hours of the day. The smartphone opens up the books of human knowledge to those who have never had access to it before. And that is seriously going to accelerate economic growth in just about every other field as well. That peasant farmer trying to manage his acre of maize using nothing but a hoe and a machete: sure, he’s not going to be the world’s greatest user of Facebook…but he will benefit massively from information about weather, market prices, and better farming practices.

            Because of mobile, removing regulatory hurdles goes from being a potentially vicious cycle to a more virtuous one that can help millions of people climb out of poverty. And the next big companies wouldn’t be built in the U.S., but elsewhere in the world instead. For example, as mobile payment systems like M-Pesa create opportunities in banking, risk-sharing, and more, they’ve expanded to areas outside of Africa as well — including Europe.

            Meanwhile, allowing more experimentation in financial services could help those in countries that don’t have stable currencies (let alone banks) to more easily save and move their money across borders; some of these places would leapfrog, innovation-wise, through something like bitcoin. As for other domains, if we think of airspace as the next Internet-like platform, lifting restrictions on drones is one way to give other regions a chance to become the next significant locus of innovation.

            In fact, this kind of competition is probably the only way to create successful innovation clusters that can compete with the huge advantage Silicon Valley already has. In the United States, the “death of distance” due to improvements in communications technologies has historically benefited only ideas-producing places like New York, but not goods-producing ones like Detroit. That’s why turning Detroit into a commercial Drone Valley could draw the innovative people who in turn want to be near other innovative people around that domain.

            It’s already happening in places like Brazil, which are becoming known for being commercial drone-regulation friendly. It’s also happening in other domains, as genetic reporting companies like 23andme are forced to explore opportunities abroad, athletes go to places like Germany for biologic medicine, and even Japan considers slashing regulatory red tape to attract more drug R&D. But these examples are more reactive than proactive; I’m arguing for cities, states and countries to more systematically consider and create their regulatory competitive advantage. (If you don’t know what that advantage is, the best place to start is with local universities. Have a special competency in materials science? Then begin there.)

            This kind of regulatory arbitrage is already happening in the United States, too, through innovations like Google Fiber. Instead of the traditional model where telecoms competed to be in a particular city neighborhood, cities are the ones competing to get Google Fiber. And the ones most willing to relax their oft-arbitrary regulations and fees are the ones getting it.

            That’s another advantage of the regulatory arbitrage approach: It helps shake up regulatory capture altogether. The best defense of regulation is its use in protecting consumer interests, but the reality is that agencies and incumbents tend to watch out for their own entrenched interests and extract rents instead.",
           title: "What It Will Take to Create the Next Great Silicon Valleys, Plural",
           header: nil,
           format: article
          }
        ]
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
            header: "This discussion covers Ben and Marc’s marriage, er, partnership; the evolution of VC and “talent as a network”; and where are we right now on industries being affected by tech (such as retail) and tech trends (such as VR/AR and wearables) — and where are we going next? Finally, is software eating culture… or is it the other way around?",
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
            url: "https://www.youtube.com/watch?v=JYYsXzt1VDc",
            content: nil,
            title: "Big Breakthrough Ideas and Courageous Entrepreneurs",
            header: "Marc Andreessen, Co-Founder & Partner at Andreessen Horowitz, discusses his philosophy on investing in technical founders and the role of technology in today's startups. Andreessen also addresses the kind of entrepreneurs and ideas his venture capital firm look for: 'Big breakthrough ideas often seem nuts the first time you see them.'",
            format: video
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
            content: "REID HOFFMAN: My friend, Sam Altman, is a bit of a geek.  And he’s OK with me saying that. I asked.


SAM ALTMAN: …to talk about my nerdy qualities, I approve of that.



HOFFMAN: I thought you did.



Many people have noted you have an affinity for cargo shorts.



ALTMAN: Honestly, I don’t think they’re that ugly, and I find them incredibly convenient. You can like put a lot of stuff… I still read paperback books, I like to carry one around with me. I carry like, computer chargers, cables, they’re just like efficient.



HOFFMAN: It’s somewhat your Batman utility belt.



ALTMAN: Yeah, you just can carry a lot of stuff.



HOFFMAN: People don’t often ask Sam directly about his cargo shorts. Or his geekiness, for that matter. Sam’s the president of Y Combinator, one of Silicon Valley’s most prestigious startup accelerators. He’s incredibly respected, and founders everywhere know that he can can make or break their fledgling company.



But if you really want to understand Sam, you’ve gotta understand what species of geekdom he falls under. Sam is not just your garden variety geek. He’s a student of the history of geeks.



ALTMAN: An aspiring student.



HOFFMAN: Aspiring student, with a fascination for an entire range of tech.



So one of the pieces of tech that you ended up getting was a bronze sword.



ALTMAN: …I’m not sure exactly which sword you’re referring to,



HOFFMAN: Turns out, Sam has a whole collection of swords and battle axes. And this fascination with ancient weaponry has put him in some uncomfortable situations. I asked him about one.



HOFFMAN: One of the things I learned from the New Yorker profile is that you occasionally bring a sword in with you to interview an entrepreneur.



ALTMAN: No, that’s not true.



HOFFMAN: No?



ALTMAN: Either they wrote that wrong… No, I think I remember what happened.



HOFFMAN: So here’s the story as Sam remembers it: A reporter from the New Yorker had been shadowing him for weeks to work on a profile. They’re in Sam’s home office, sitting through meeting after meeting, and Sam is getting bored.



ALTMAN: It’s the 16th meeting of the day and I needed some energy.



HOFFMAN: Suddenly, a package arrives, and Sam gets really excited.



ALTMAN: I had bought this Bronze Age sword.



HOFFMAN: Yes, you heard that right. A Bronze Age sword.



ALTMAN: It had just arrived, and I had been waiting for this thing, you know, like it had flown all the way from Europe and it was in this big crate, and I got it out. It’s stunning, perfect. And so I was like so excited.



I mean the first thing you do is like pick up and swing it, and see like how it’s weighted, how it feels. This particular one it had, like you know, the nicks where it hit people’s helmets a couple of thousand years ago. It’s a little dark, but…



HOFFMAN: Or maybe bones, right?



ALTMAN: Too much of a nick for a bone. Too deep of a nick in the metal.



HOFFMAN: The nicks in the metal might not have been from bones, but he’s swinging around this massive weapon from the Bronze Age with a journalist from The New Yorker in the room. And the day isn’t over yet.



ALTMAN: I was on the phone, and it was kind of like a not particularly exciting conversation. So I picked it up, and I just started, while I was on the speakerphone, swinging around and fighting this pretend enemy because I was so excited. I just got this. I had been waiting for it for so long. And I didn’t realize ‘till I put it down at the end that that was probably really dumb, and it was probably going to make it into the profile. Because a reporter was sitting there watching. You kind of just forget after someone’s with you for weeks. But I have never swung a sword at someone during an interview process.



HOFFMAN: I’m glad we can finally put that rumor to rest. The Headline “Sam Altman swings swords at young company founders” can officially be put in the category: Fake News.



He’s not just an Ancient History geek, he’s a geek history geek. He collects tech artifacts — from historic computers to jet engines – any object that represents a breakthrough in engineering history. And that’s also essentially what he’s searching for today. A technology that’s so new, so unlike anything that’s come before, it unleashes a geyser of demand. There have been consumers, across all eras, who just had to have the next big thing.



And if the history of geekdom has taught Sam anything, it’s that a product that’s deeply loved by a small group of early users is a product that can scale. I agree. And in fact, I believe it’s more important to have 100 people who LOVE your product than a million who just sort of like it.



[THEME MUSIC]



HOFFMAN: I’m Reid Hoffman, co-founder of LinkedIn, investor at Greylock and your host. And while I’m obviously a big believer in creating things that can scale, I believe it’s more important to have 100 people who LOVE your product than one million who just sort of like it.



And this isn’t always obvious. Many entrepreneurs fall into the trap of chasing the illusion of scale – the one million users who show up to use a flash-in-the pan product. What you actually want to do is seek out the true seed of scale, which has much humbler origins. Many great scale stories begin with a tiny kernel of die hard fans, no more than 100 strong — who are almost zealous in their passion for your work. They hang on your every product release. They can’t believe they ever lived without you.


Think of Sam when that sword arrived.



ALTMAN: I was so excited. I just got this. I had been waiting for it for so long.



HOFFMAN: It sounds like that.



And when a user like Sam gets excited, that matters — not only because it drives use and loyalty, but because it will drive him to tell his friends. And if he tells two friends. And they each tell two friends. And they each tell two friends. Well, that story gets pretty big pretty fast.



I wanted to talk to Sam Altman about this, because he has an uncanny eye for these kernels of passionate, early users. Y Combinator has become known as a kingmaker in Silicon Valley. Their alumni include AirBnB, Dropbox, Stripe, Reddit, and more than 40 companies that are valued at 100 million dollars or more after being incubated at Y Combinator— or YC as we call it. But Sam doesn’t look for kings. He looks for startups that show these early signs of love from their users.



And how does he spot them? He pattern-matches with history. Think about his private collection of engineering milestones. He has an insatiable appetite for these objects, and his collection is constantly expanding.



ALTMAN: I like things that were super-important technological milestones in human history, even if they look like not really technology. So I’ve got a big collection of handaxes, which is the longest-serving by far—like a million-and-a-half years—piece of technology in human history.



HOFFMAN: Is there any particular artifact that you’re hunting for?



ALTMAN: I don’t know how I’m going to get this one, but I would like an F-1 engine, or at least I would like the bell of an F-1 engine.



You know, Bezos got one by pulling it out of the ocean, and convincing NASA to loan it to him. I mean, that’s really a lot of work.



HOFFMAN: Is there another one or two? Because this is actually personally fun.



ALTMAN: Alan Kay gave me an Alto.



VOICE: Alan Kay created the first computer with a graphical interface, called the Alto. It inspired the first Macintosh.



ALTMAN: That’s not the very last computer that I think is within my capability to understand everything that’s happening in there, but it’s getting near the end.



HOFFMAN: This collection is like the whetstone Sam uses to sharpen his instincts. When he’s deciding which founder to admit into a Y-Combinator class, he looks for a ground-breaking idea that has the potential to give users something they can’t live without. If he doesn’t see it, he passes.

But to understand how Sam spots the indispensable startups, you have to know how he arrived at YC himself. He wasn’t predestined to become the startup kingmaker. When he graduated from college, it could’ve gone either way.



ALTMAN: I’m very ashamed to say that I had been planning to go be an intern at Goldman Sachs that summer.



HOFFMAN: “Ashamed” is a pretty strong word. And a distinctly Silicon Valley reaction. After all, it’s tougher to get a job at Goldman Sachs than it is to get into Harvard. Only about three percent of applicants get hired. It would make his family proud and his friends envious.  He could live comfortably ever after.



Or he could take a far less comfortable path — one better suited to my cargo-short-wearing, bronze-age-sword-wielding friend. It began with a little mobile app Sam and his friends developed while studying at Stanford. It was called Loopt, and it let you share your location with friends.



ALTMAN: It started as just a project that we worked on sort of like after class and at night. We had worked on it during a spring quarter and it was really fun.



HOFFMAN: “Fun” isn’t exactly a sound business plan. And what makes this idea even shakier, is that it’s 2005 — two years before the first iPhone was even invented. The word “app store” had not entered into our vocabulary. So the odds of making money with this mobile app were incredibly low. And remember, the odds of making money at Goldman Sachs are 100 percent. The odds were stacked against Sam and his startup, and everyone could see it.



ALTMAN: If you said you were working on a startup, people sort of laughed at you in a not nice way.



HOFFMAN: But not everyone was laughing. A new community was just forming. One that was deadly serious about startups — and fun. It was called Y Combinator, and it immediately called out to Sam. For starters, its founder was the now legendary computer scientist and entrepreneur Paul Graham.



ALTMAN: We all kind of knew who Paul Graham was. We had followed him online and he posted this thing saying like hey, not excited about your summer job? Come hack on your project and you know make a startup and it seemed like it would be more fun than being an investment banker.



HOFFMAN: Fun actually can make business sense. If you love what you’re doing, and other people do too. And Paul was determined to prove that young innovators with deep passions could find success if they were willing to take a gamble.



But this was a controversial idea outside of Y Combinator. Paul Graham was considered a sort of pied piper for young entrepreneurs — leading them down the road to ruin.



He wrote an essay about this, in 2007, which you can find on Masters of Scale.com.



Traditionally, investors would fund a company in stages — show me growth, and I’ll show you the money. Step-by-step you had to show user growth, hypothesize how much they’d spend on your product and lay out in painfully minute detail how much money you’ll need and how much money you’ll make. It’s classic Business 101 thinking. And it can be exasperating for a founder.



I experienced it myself when I was raising a series A round for LinkedIn. Right around the time Sam was a college student, I was looking for investors.



At the time, potential Series A investors wanted to see a business model that showed how LinkedIn would get to profitability. I told potential investors that we weren’t going to generate revenue until after the next round of funding, and that therefore it shouldn’t matter to them. They insisted anyway, so the team and I generated a financial model that included revenue sources. I don’t even remember what we put in it! Rather than wasting weeks on it, we simply set aside a single evening, drank a couple of glasses of wine, and put together the model. I might have been a little miffed at even having to waste the single evening, but it was pretty good wine, so it wasn’t a total waste.



Contrast that with an investor like Paul Graham. He says, “Forget the spreadsheets. Quit speculating. Just start building on a shoestring budget — and build something a tiny cohort of users will love. Love is all you need.”



Some of you might be rolling your eyes at this idea that love is all you need. So I want to share a story that might soften your cynicism. It comes from Dominique Ansel, the famed New York chef who invented a pastry that became a global sensation. You may have heard of it. It’s called… The cronut. It’s part donut, and part croissant.



Ever since the cronut became the hottest thing since sliced bread, people have been mistaking Dominique for a master of publicity. A sort of PT Barnum of the baking world. So our producers visited Dominique’s Manhattan bakery, and asked how he engineers these publicity coups. Dominique’s answer: He doesn’t.



DOMINIQUE ANSEL: There was no marketing. There was a team of literally four employees and myself and when people approach me and ask me what my marketing strategy was and what was my budget to launch a company like this, I’m “You guys don’t understand. It didn’t happen this way.” We’re a small, small bakery. A tiny bakery. A neighborhood bakery on a street of Soho and it happened naturally, organically.



HOFFMAN: Here’s Dominique’s memory of how the cronut scaled, naturally. Every day, he bakes a fresh batch of croissants, and studies them like a scientist.



ANSEL: I actually look at it every day. I cut it in half and I look at what we call the honeycomb which is the structure created by the fermentation of the dough. All this little air pockets that are inside. The fermentation, you have to smell it. It’s a different type of fermentation. The crust, the volume, the flakiness, everything is so, so important. It’s alive.



HOFFMAN: This obsession with the fermentation, the flakiness, the technical details — reminds me of all the great product designers I know. Dominique was singular in his focus in getting his croissants right. Then one day, Dominique’s staff challenged him to make a donut instead.



ANSEL: I don’t do donuts. I told them that I have no recipe for donuts since I’m French, but I most definitely can come up with something new, something special.



HOFFMAN: 100 taste tests later, the cronut was born. A food blogger, Hugh Merwan, arrives, snaps a photo, and shared the invention with his fans on GrubStreet. The massive response stunned even the blogger.



ANSEL: He called me the same afternoon letting me know that he had an increase of traffic of 300% on his website and over 140,000 link and he told me to be ready to be busy tomorrow.



I had no idea what he was talking about. I was happy for him. I told him “I’m happy for you. I need to go to sleep.”



HOFFMAN: Dominique and his staff were facing a situation I’m all too familiar with: It’s the inevitable fallout on the morning after the overnight success.



ANSEL: And the next day we had over 100 people outside. By the third day, we had over 150 people waiting outside. It was just overwhelming for everyone and it was very sudden and this doesn’t happen, but it happened to us. It was just overwhelming for everyone. The staff all wanted to quit. It was too much.



HOFFMAN: The rest is pastry history. And if Dominique’s staff initially wanted to quit, they soon learned to cultivate the unexpected outpouring of love. His staff treats the loyal customers lined up outside like invited guests, serving them hot chocolate before the bakery opened each day.



ANSEL: I think it’s important for any chef to be in touch with the guest, the customers. To see them and listen to them. Especially for the holidays to be there for them. To wish them a happy holidays and thank them for keep on coming to our shop. I think it’s important we have a lot of very loyal customers. A lot of people from the neighborhood and at the end of the day, a bakery is a local business. It is a neighborhood business and it’s not life without the people in the neighborhood.



HOFFMAN: If you’ve never waited in line to enter a popular New York store — like Supreme, for example — you may not realize just how radical these small acts of kindness are. And I suspect it had no small impact on the cronut’s success.



But if you think Dominique now sits around trying to concoct the next novelty goodie, think again.



ANSEL: I don’t think there’s a need or a desire for me to try to recreate something like the cronut. I don’t think I can and I don’t think I want. I aim to create pastries that talk to people and of course I want them to be popular. Of course I want them to be successful. Of course I want people to appreciate it, but I’m not trying to be gimmicky or trying do something that doesn’t mean anything to me. I’m still trying to translate my ideas through pastries. You cannot force it. Even with all the money in the world, you cannot recreate the cronut. Even if you can hire the biggest team, the smartest people, you cannot recreate something like the cronut.



HOFFMAN: You could apply the same argument to just about any globally successful product. All the money and all of the marketing savvy in the word cannot sustain its growth in the long-run. You need more than your customer’s attention. You need their unflagging devotion. And this poses an almost Zen-like riddle for entrepreneurs: The first step to scale is to renounce your desire to scale. Focus on those happy few.



This is a concept that every artisanal maker of small-batch goods grasps instinctively. Scale entrepreneurs? Not so much. But Paul Graham was determined to prove that the same fundamental truths applied to entrepreneurs with global ambitions.



And to prove his point, he offered a laughably small sum of seed money to those early Y Combinator entrepreneurs, like Sam: Each one got $6,000, plus free dinners. That’s it. Off you go. Sam was intrigued.



ALTMAN: So we applied to YC and flew out and interviewed and got funded. We’re actually the first company ever funded by YC and then it just kept going.



HOFFMAN: So Sam entered what’s known as the first class of entrepreneurs to get accepted into Y Combinator. And they were essentially the guinea pigs who were meant to validate Paul Graham’s theory of scale. And Sam offered quite the validation.



After graduating from YC, his company Loopt struck deals with Sprint, Verizon, Blackberry, and AT&T. With the advent of the iPhone, they were positioned for growth, and became one of the first offerings in the iPhone App store. Here’s Sam, sharing the stage with Steve Jobs in 2008:



ALTMAN [Recording]: We are incredibly psyched about Loopt on the iPhone. Location, plus a contact list, and information about cool places means you never have to eat lunch alone again, or at a bad place. And we think that’s really cool, we really do. You can use Loopt with your friends on most other carriers…



HOFFMAN: In 2012, Loopt was acquired by Green Dot Corporation for more than 43 million dollars.



ALTMAN: We got acquired and I was trying to figure out what I wanted to do next.



HOFFMAN: Sam was 26 years old.



ALTMAN: And I decided I was going to partly take a like a sort of mid-career sabbatical race cars, fly airplanes, travel the world, all that kind of stuff.



HOFFMAN: When he wasn’t on the race track or in the air, Sam tried his hand at the venture capital game. He had an eye for it, investing early in companies with real potential. But it just wasn’t his idea of fun.



ALTMAN: I liked running a company I did not like being on the sidelines and I didn’t get the adrenaline rush I get out of being in the trenches of running a company, which I think is something that a lot of founders miss when they start investing.



HOFFMAN: Sam missed being in the trenches. He felt adrift. And Paul Graham, Sam’s mentor, could see it.



ALTMAN: And I was thinking about things I wanted to do and Paul Graham sort of jokingly said a number of times over the years that I’m going to retire and you should take over YC.



HOFFMAN: Turns out Paul Graham was only half joking. In 2014, he asked Sam, in all seriousness, to take over Y Combinator. Sam accepted the offer, and became President of Y Combinator at the age of 28.



Despite his youth, he was the perfect fit. YC isn’t just an investment firm. It’s an incubator for founders who want to reshape the future. Think of Y Combinator as an extension of his bronze age sword collection — only this time he’s collecting the people who can make the swords that will change the world.



So where does he begin? He begins with a simple mantra. He repeats it to every founder that comes through YC’s doors: Love is better than like.



I asked him why it bears repeating.



HOFFMAN: So love is much better than like. Why this central mantra within YC, and all of the startups that are coming through?



ALTMAN: Well, I think there’s a few different reasons for that. One is it objectively seems to be true. If you look at the companies that have gone to become super important and valuable, and shaped the world in a big way, they tend to have fairly fanatical early users. If you think about how you first came across Facebook or Google, it’s very likely because a friend told you how great it was.



HOFFMAN: It is indeed objectively true that these hit products spread by word of mouth. On the other hand, I can point to a whole graveyard of startups that started out with passionate users. And then the passion faded. The startup withered away and died of loneliness. It’s heartbreaking.



So passion is a great early indicator of success, but it leads to a vital question that every founder must ask a user: How deep is your love?



Sam has a clever way to plumb the depths of their affection. When the first iPhone came to market, everyone was agog at its new features — a touch screen! Apps! Music on your phone! But Sam wasn’t just studying the features. He was studying iPhone users. Intently.



ALTMAN: So one of the things that was obvious when people got iPhones even though you know only a few million of the first iPhones sold, most people who had them used them every day and loved them and it became like their most precious item.



I remember shortly after the iPhone came out I was in a developing world country it was really quite poor and people had nothing except they all had a smartphone. And once they had one like you know you read these statistics and people need to do some lightweight journalism about, “Would you rather give up your smartphone or X” and it doesn’t really matter what X is, they’re gonna keep the smartphone.



And so I think you could have predicted with a lot of certainty, and many people did, that this was going to be a large market.



HOFFMAN: This is a rather extreme case of attachment to a product. The odds that you’ll create a product that is so addictive, your fans would give up all their other worldly possessions for it — are pretty much slim to none. But the extremity of that thought experiment is clarifying.



You want to make your product as indispensable as humanly possible. That’s your primary objective — before you shore up your business plan, or plan your PR campaign, or any other steps along the road to world domination. Your first step must be, make yourself indispensable. But the truth is, you’re unlikely to build a product that makes a user say “I’d give up my left arm to use this.” So short of that ideal, Sam sets a more modest objective for founders. Focus on love, not likes. Sam can’t stress this enough.



ALTMAN: And that’s really important, because the startups, once they get big enough, can only grow by word of mouth. All of the growth hacking eventually stops working. If you’re going to keep growing exponentially at some point, it is probably going to be because people tell you, “You’ve got to use this product with me,” or, “You’ve got to try this, it’s so great.”



HOFFMAN: “You’ve gotta try this.” There’s a hidden power to that simple phrase — which Y Combinator has elevated to an almost mythic status. It’s like “open sesame.” Once invoked, Y Combinator graduates react as if a wall has opened up before their eyes, and the secret pathway to scale is laid out at their feet. They know that if they keep hearing the words “You’ve gotta try this,” it will propel them into the far-off future, the years that their valuation is based on.



ALTMAN: And that seems to be really important, because the startups—so much of the value is in the far-out years.



And in those years, it depends on continuing to grow at these fantastic rates.



HOFFMAN: By fantastic rates, he means “exponential” rates — the sort of viral growth that can only occur when that first cohort of users says “You’ve gotta try this” to two friends each, and they say “You’ve gotta try this” to two friends. And so on and so on. This can scale to millions of users in a matter of months.



But make no mistake, it’s exceedingly difficult to kick off this chain reaction, unless you’re willing to hone in on a tiny cohort of users. You should almost have a willful blindness to growth, and a monomaniacal focus on making just a few people happy.



AUBRIE PAGANO: You win people over one person at a time.



HOFFMAN: That’s Aubrie Pagano, co-founder and CEO of Bow & Drape, a fashion line that lets customers personalize the design and fit of any piece of clothing. And she had to fight for that early cult following.



PAGANO: It’s hand to hand combat, and especially when you’re under resourced, even when you are well resourced actually, it doesn’t matter.



There’s no cutting corners around that. You can’t throw enough money at that problem, you can’t trick people into loving your brand. You just have to win that over. That’s how we grew the brand. We grew the brand through word of mouth. We didn’t even start marketing until last year.



HOFFMAN: Mind you, they’ve been in business for five years – and by their third year, Bow & Drape had grown revenue by over 300 percent from their first.



PAGANO: It was all word of mouth. And I really do think that that is such an important part to early success.



HOFFMAN: And if your users really can’t stop raving about your product, you can defer marketing indefinitely. Even if that product is…underwear. No matter what kind you wear, no matter what gender you are, I’m going to bet that you’ve heard of them. Spanx has been the name in undergarments since it launched in 2000. Sara Blakely, the founding CEO, has come a long way since she was shipping packages from her home in Atlanta. One thing she never updated? Her marketing plan.



SARA BLAKELY: I ran Spanx out of my apartment for two and a half years with a handful of people before we moved out of my apartment. You know, it’s been like that. I mean I had $5000 and I’ve been self-funded from the start. So I didn’t ever raise a bunch of money, I didn’t even know how to do that or that that was even really an option. And you know Spanx has never advertised until this year and we’re 16 years old. So this has been a word of mouth brand.



HOFFMAN: And Sara didn’t spread the word about Spanx on her own—she recruited an all-volunteer sales force. She found a way to enlist department store clerks to her cause — by setting up booths in quiet store corners. Sara’s enthusiasm was infectious—not just to shoppers, but to anyone within earshot.



BLAKELY: So for the next two years I stood in department stores for literally eight hours a day and in the entrance of Neiman’s or where cosmetics were were there were so much more foot traffic.

I set up a little table and I had my own display table and I brought my own television with a VCR in it and put the Oprah tape in there and some other news clips that had happened to me and I was like a one woman show. What I was doing is I was creating this very loyal sales force that wasn’t on my payroll because I would win over all of the associates at every Neiman Saks Nordstrom that sold the product by being there and explaining it and giving away free product to them. I would do morning rallies for the store before the store opened.



HOFFMAN: So Sara targeted users who would bring in more users. She honed in on heavy hitters: people who already had the platform to do her marketing for her. The power of word of mouth is multiplied exponentially if you can recruit anyone that comes with a megaphone—whether it’s a salesperson in a department store or Oprah Winfrey. But what comes next? After you have gathered new users around, how do you know they’ll stick around?



At a certain point, as you’re zipping up a growth curve, you may think those users are here to stay. Retention is strong. Growth is ticking upward. And the only thing standing between you and global domination is a slick sales and marketing campaign. You’ll try to hack your way to growth through targeted ad campaigns and promotional offers. And you’ll have all of the appearances of growth. But Sam has a warning for you. Scaling falls into two categories — the easy kind and the hard kind. And you may not know you’re doing the hard kind of scaling until it’s too late.



ALTMAN: The hard kind of blitz scaling is where you try to start scaling up before the product is really great. And then most of your effort in scaling is to generate demand. So I think the number one most important insight about how to blitz scale is that the good kind of blitz scale is when you are not having to generate demand as you go but that you first got the product right.



HOFFMAN: So the easy kind of scaling is when you first got the product right. When you’ve created something users LOVE, and instinctively want to share. This kind of scaling happens organically, as users bring in other users. The hard kind of scaling is when you only get the product half-right. When you’ve created something users KIND of like, and which they’ll use. But not something so good that they stick with it, and certainly not so good that they’d think to share it.



ALTMAN: And that’s something we see, again and again. People don’t stick with products that they don’t love. And so it is easy to get a lot of people to try something with a clever growth hack.



The value of those users is often very low. They use it for a little while, you engage them with some trick, and they don’t stick around. And that is not how you build these enduring, valuable companies. You need things that people want to come back to and use a lot, and I think it’s much easier to figure that out early, when you can still make a lot of changes to the product. Everyone’s like, “Well, I’m just going to get a lot of people to like me, and then I’ll figure out how to make them love it later.”



In practice, that’s really rare. I would challenge you to think of an example.



HOFFMAN: Challenge accepted. I actually founded one of these companies: LinkedIn. One rather striking exception to Sam’s rule.



We had a passionate set of early users, but these were not the users that helped us get to scale. We were grateful, we appreciated their support, but what they ultimately wanted from us wasn’t something that we could deliver. I explained this to Sam in our interview.



HOFFMAN: And so LinkedIn, for example, is one, because of our early users who loved us, called “open networkers,” they put it in their headline—called “LIONS”—”LinkedIn Open Networkers.” They loved us because they wanted us to be something different than what we were. They wanted the whole world to say, “Everyone should be able to connect to Bill Gates, and have him connect back.”



And it’s unrealistic about Bill’s time and commitments, and things he needs to be doing. And so we are not an open network. And it took us to get to scale, when other people started loving us, the kind of people that we were targeting.



Because the thing that I completely agree with is, well, if you don’t have millions of people loving you, you don’t have a fundamental company. But the question is, the initial people we had loving us at LinkedIn were not the people that we wanted to love us when we were hundreds of millions.



ALTMAN: We’ve seen a version of this pattern a bunch of times, which is, if you have a network-effect consumer business, you have this cold start problem.



HOFFMAN: Exactly. If scaling your product is ultimately dependent on having a large group of users, then you have a chicken and egg dilemma. The truly magical features we envisioned, simply couldn’t come to fruition until we had a dense network of users. We wanted to create such a vast reservoir of talent that a recruiter could say, “I’m looking for an accountant based in Biloxi, Mississippi who has a humanities degree plus 10 years of work experience and the capabilities to lead team-building events.” And I wouldn’t be surprised if you could find that dream candidate in just one click.



But it took years of clever hacks and grunt work to enable that sort of high-definition headhunting. And those valuable users just weren’t going to LOVE us straight out of the gate. So how do you get there? You work in batches, adding one narrow group of users at a time. Sam explains.



ALTMAN: You’ve got to find someone or some set of people that are going to use you a lot in the early days. And that may be a small, narrow-but-deep wedge, and then you expand it later.



And this is fine. We see this all the time with companies, where they start with some group of users that is not a particularly lucrative market—maybe not be the long-term users they want, but people, for whatever reason, can use the product a lot and get a lot of value out of it, and you use that as a bootstrap to create value for everybody else.



HOFFMAN: Another example is Facebook. When Facebook first launched, it was only for the students of a few colleges. It slowly expanded from Harvard to Columbia to Stanford, and beyond. But the ultimate way to scale was to go far beyond college students. Sam explains.



ALTMAN: In fact, Facebook—it turns out that their most profitable market is not students at the 10 most elite colleges. But those are people with a lot of time on their hands, they really cared about their social lives, they all had Internet access at a time when not everybody at that age did. And so it turned out to be a really good primer.



HOFFMAN: That’s right. Sometimes you can’t get to the millions of people who love you until you’re actually at a critical mass. Just like Facebook, LinkedIn had to find its initial users from somewhere.



The next generation of truly lovable ideas will look nothing like the previous generation. If you take a backward glance at Y Combinator’s most stellar graduates — Airbnb, Drobpox, Stripe — you’ll think they’ve mastered the app economy. And the assumption is that Y Combinator should stick to what they know.



Sam begs to differ.



ALTMAN: YC was mostly funding software companies but I had a lot of conviction that we could apply the same thing that made YC work so well for software companies to companies in a lot of the areas that I cared about: AI, synthetic biology, energy.



HOFFMAN: This may sound like a radical leap outside of Sam’s area of expertise. After all, you can’t build a supersonic jet on a shoestring budget. You can’t ask a user to hop into an experimental self-driving car and hope they come back in one piece to give you their feedback.



And when you think about the differences between apps and what is often called “hard tech”, you might be tempted to ask Sam, “What on earth are you doing?” In fact, Sam hears this a lot.



ALTMAN: But at the time it was like this is a really dumb thing. One of the things that is funny as a side note and just as a note to anyone that tries to do anything. Where you take a company in a different direction or scale it is that it is always funny to sort of like read the articles from the same journalists that when you say you’re going to do this thing say like, Sam is crazy, completely unqualified and not going to work, YC is going to die, going after hard tech companies is so stupid.



HOFFMAN: But to Sam, this leap into the unknown is completely consistent with Y Combinator’s mantra: Focus on love, not like.



To him, if a company is inventing something unheard of, you can ensure users will love it right from the proof of concept. Who wouldn’t love the invention of a supersonic jet? Or a self-driving car to battle through rush hour, while you flip through a magazine? Or a cold fusion energy plants that simultaneously make energy cheap and solve climate change?



ALTMAN: One company that you and I were talking about recently is this company called Boom; they’re making a supersonic airplane. And they really have lit up people’s imagination, and people really want it. People really love the idea of going to Japan in a few hours instead of 10 hours from San Francisco.



HOFFMAN: Boom Technology, the supersonic jet company, graduated from Y Combinator in 2016. One year later they raised $51 million in venture capital.



Here’s the magic of tackling the seemingly insoluble engineering problems. People fall in love with your idea alone. Take, for instance, Boom.



ALTMAN: It is harder for sure to make a Mach 2.2 airplane than a Mach 0.95 airplane, but it is easier in the sense that people care. People want to be part of it, people are excited. People pay attention. The CEOs of large airlines decide to come visit you. And that’s what we see, again and again.



HOFFMAN: That so-called “hard tech?” Sam says it’s easy.



ALTMAN: This is why I tell people that, in many ways, it is easier to start a hard company than an easy company.



HOFFMAN: So ironically, it may be harder to start an easy company. And easier to start a hard company. They’re just so lovable.



And now Sam notes with wry amusement that in a span of 14 months, press coverage flipped from scornful to glowing.



ALTMAN: Like Sam is a genius, it is like predestined, he was going to take over YC.



I think you have to ignore all that and just say like I have a high level conviction and we’re going to try this thing. And most people will tell you it’s not going to work. If it’s something new. Most people are afraid of things that are new and you just do it. It’s probably not that risky. Probably won’t kill the company and probably undervalue if everyone else says its stupid. So we were able to do that. And the first thing was expand YC into all these different directions. I think the greatest companies are created on kind of the bleeding edge of what people are working on.



HOFFMAN: And when you think about it, this brings Sam one step closer to expanding his collection of engineering milestones.



It’s only at the bleeding edge of innovation that you can discover a product that makes you say:



ALTMAN: It’s stunning, perfect. And so I was like so excited. I had just got this, I’d been waiting for it for so long.



HOFFMAN: I’m Reid Hoffman. Thank you for listening.",
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
            url: "https://www.youtube.com/watch?v=ZoqgAy3h4OM&list=PL11qn6zM2Y3aK3gGWZSaadL8HTZE2_6-U&index=1",
            content: nil,
            title: "How and Why to Start A Startup",
            header: "Y Combinator president Sam Altman knows: It's better to have 100 users love you than 1 million kinda like you. The true seed of scale is love, and you can't buy it, hack it, or game it. A product that is deeply loved is one that can scale. ",
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
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
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


