Title: Using Yahoo! Pipes: Your Most Recent Nike+ Run in Friendfeed
Date: 2008-10-18 18:17:42
Slug: 2008/10/18/using-yahoo-pipes-your-most-recent-nike-run-in
Tags: en, friendfeed, hacking, howto, nike, running, yahoo! pipes


During the last few weeks, I've built a couple of pipes I want to share.
("Pipe", in this context, means an application built in [Yahoo! Pipes][1].)

![][2] Here's one of them.

### Your Most Recent Nike+ Run

As I've mentioned [once or twice in the past][3], I've become a more or less
avid runner during the last year. One central piece of my equipment is my
[Nike+][4]. I don't run without it. I am a geek, I love numbers. The Nike+
provides me with numbers. It makes running a game.

I sync my iPod with my iTunes after each run, and the [Nike site][5] is taking
the raw data, crunching it, giving me graphs and more numbers, and (this is
the interesting thing) badges for my website.

Now, I don't really care about those. But when there are badges, there must be
an API which provides the raw data to them. Looking behind the scenes, I
quickly found it. It's not password-protected or secured in any way; when you
set your nikeplus.nike.com profile to "public", the API will return some of
your data (run overviews, run details etc. -- no personal details).

![][6] So, knowing the API URL, I've built a pipe which will do a few things:

  1. Accept any nikeplus.nike.com "brag"-type of link as parameter (when you're logged in to the site, these are usually labelled "Share with your friends", "Grab the link" etc.).
  2. It will extract your public, numeric runner ID from this link.
  3. It'll fetch the data for the most recent run of the runner with this ID, i.e. you.
  4. It'll build an RSS feed with the data of your most recent run.

When writing the pipe, I've made a few assumptions, namely that…

  * you sync your iPod after each run
  * you're using the Nike+ site
  * you don't run more than once per day.

Since I am lazy, I'll only use the data for the most recent run, so the pipe's
results will be exactly that -- just a single item, your most recent run.

That being said, I found this sufficient. After adding the pipe's RSS URL as
new "Custom RSS"-type service to Friendfeed, FF will effectively trigger the
pipe a few times each day, and your latest run will be added to your stream
quickly. Next time you sync your iPod, the Nike site will pick up the new
data, the API will return the new data to the pipe, and the new run will be
added as new Friendfeed item.

The pipe will post your runs in the following format: "_[Nike+ runner name]_
ran _[distance]_ _[km/mi]_ in _[time]_", for example "3R ran 11.3543 km in
1:03'54"". The message will link to the public page of the run -- a page [like
this][7]. (3R is my Nike+ moniker.)

Now, why would I want to add my runs to Friendfeed? Well, why not? For me,
running is a nice part of my life. I'm actually enjoying it, I'm keeping it
casual, and I am proud of every damn kilometer mark I pass. Plus, as
mentioned, I am a geek, and I like to share what I build. :)

If you have questions or suggestions, speak your mind in the comments.

  * Yahoo! Pipes: [Recent Nike+ Run][8]
  * Friendfeed: [the result -- my Nike+ runs as added service.][9]

   [1]: http://pipes.yahoo.com
   [2]: http://dl.dropbox.com/u/7298/blog/wp-content/2007/02/logo-lg.gif (Yahoo! Pipes logo)
   [3]: http://carlo.zottmann.org/tag/running
   [4]: http://carlo.zottmann.org/2008/05/04/still-running-april-2008/
   [5]: http://nikeplus.nike.com
   [6]: http://dl.dropbox.com/u/7298/blog/wp-content/2008/05/nikeplus.png (Nike+ package)
   [7]: http://nikeplus.nike.com/nikeplus/?l=runners,runs,2028425749,runID,1278781372
   [8]: http://pipes.yahoo.com/czottmann/nikeplus_recent_run
   [9]: http://friendfeed.com/carlo?service=feed&serviceid=5f91145ba81e45fcab7b692c201e3a04
