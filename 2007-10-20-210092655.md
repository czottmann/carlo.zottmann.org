Title: Lifestream Tinker Toy, Powered By Yahoo! Pipes
Date: 2007-10-20 15:16:38
Slug: 2007/10/20/lifestream-tinker-toy-powered-by-yahoo-pipes
Tags: code, en, hacking, howto, javascript, yahoo!, yahoo! pipes


So, (almost) everyone is totally crazy for lifestreams these days. In case you
managed to get around the whole issue so far: a lifestream is basically a big
bucket (i.e. web page) where all the updates and update notifications from
your blog, your [ADD-induced][1] Twitter posts, your Flickr uploads etc come
together in one concise way so it’s easier for others to ignore them. Also,
you only have one URL to hand out to hot women in pubs because the stream
inadvertedly works as a hub page, too!

Joy.

Anyways, I was talking with [Hendrik][2] about the various stream services out
there, and I figured it’d be fairly easy to build something server-less using
a wee bit of Javascript and [Yahoo! Pipes][3]. So I’ve spent around an hour to
do just that.

The basic idea is that you make [a pipe containing all your feeds][4], and
then access the output using Javascript from your page. Add some styling, [and
voilá][5].

It’s a bit rough around the edges, but hey, it’s just a prototype. It’s not
life- or game-changing in any way, but I’d like to share anyways.

**Update 2007-11-21:** It’s mostly broken right now since I am playing around with something. Not to worry.

   [1]: http://en.wikipedia.org/wiki/Attention-Deficit_Disorder
   [2]: http://mornography.co.uk/
   [3]: http://pipes.yahoo.com/
   [4]: http://pipes.yahoo.com/pipes/pipe.info?_id=Vhz_ufp_3BGo8ei5X0sBXw
   [5]: http://docs.g-blog.net/code/lifestream/morn_test.html
