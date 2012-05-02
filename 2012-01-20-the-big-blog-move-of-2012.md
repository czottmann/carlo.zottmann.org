Title: The big blog move of 2012
Abstract: Goodbye, Tumblr!  Hello, Calepin!
Date: 2012-01-20
Slug: 2012/01/20/the-big-blog-move-of-2012
Tags: en, tumblr, calepin


So, once again I was fed up with my choice of blogging platform.   Tumblr, [which I had turned to][tumblr-switch] after ditching Wordpress, is just not what I am looking for anymore.  It's not a bad platform in itself, but I noticed more and more that…

1. I really don't care about "liking" a post (I am talking about Tumblr's own feature, not Facebook's.)
2. I really don't like reblogging all that much.  It's great for quickfire, semi-mindless sharing of other people's content, but I try to get away from that myself, so there.
3. The lack of a meaningful export is annoying.  To be honest, it vexes me that several years after its launch, Tumblr still has no real, official, _right_ way of exporting my posts.  Yes, I know the [semi-official Mac app][tumblr-exporter] written by an (ex?) employee a few years ago, but here's the thing: I wrote all my posts in Markdown, yet the only format the export yields is rendered HTML pages.  (Find the error.)  Yes, I could've/should've made copies of the Markdown posts in the first place, before submitting them to Tumblr.  But that only brings me to my next point:
4. I don't really feel like composing blog posts in a browser window anymore, so for the last few posts I ended up writing them in a desktop editor, then copying them over to Tumblr's web interface.  Now when you want to make a change, what is the source of truth?  Why not just skip a step?

As a result, I wrote less and less.

The older I get the more I realize I really want to own my (relevant) content.  As an example, should Tumblr go belly-up tomorrow, all my precious blog posts would be gone, and I won't have that.  While I could make regular backups, it's impractical and prone to negligence; due to the way things are, "make a Tumblr backup" is equivalent to _"set a recurring reminder, then open the app, click a number of buttons, and hope the API isn't overwhelmed right now"_.  This doesn't fly.

Thus, I ended up doing a final export, then writing a custom script utilizing [html2text][html2text] which converted the HTML output back to Markdown (while mangling all footnotes — that was fun).  Once I was done with this I knew I can never go back to Tumblr.

In any case, I believe by now it's clear where I am going with this.


### Tally

So where does that leave me?  What do I want from a blogging service/engine?

- I want to own my content, meaning I want to have the original files around even when the service/engine doesn't work.
- I don't want to have to copy and paste posts into a form in a browser window.  The files on my machine(s) should be the source of truth.
- I want native Markdown support.  'nuff said.

Taking all these things into account, it didn't take me long to realize a solution based around (git-)based static file generators might be what I was looking for.  So I started testing out [jekyll][jekyll] and several other tools alike.  Good stuff — I like the idea, yet I noticed I really don't want to be bothered with git or other command-line tools when I feel like writing.  (It's a matter of taste, I guess.)


### The new kid

Then a few weeks ago I came across [Calepin][calepin].  It's a rather opinionated Dropbox-based service.  It'll pick up `.md`/`.rst` files in your `~/Dropbox/Apps/Calepin/` folder, generate a static site and serve that for you from its server (**not** from your Dropbox).

It is opinionated insofar that it assumes you want to use Markdown, might want to point your readers to your Twitter account, might want to use [Disqus][disqus] for comments, and might want to use a custom domain name, while being somewhat desinterested in customizing your blog any further.  Which is okay for me, but I'm sure it isn't for everyone.

There's some bare-bones site configuration available in the form of a `settings.json` file in the same folder — this is how you tell Calepin which Google Analytics ID or Disqus profile to use, for example.

When registering and setting up your blog on the site, you can also specify a custom domain to be used (CNAME).

Pictures and other assets can/should be served from your `~/Dropbox/Public/` folder.  Clever idea.

The per-post metadata is something very much like [YAML front matter][yaml-fm] and can be used to set title, abstract, status, date, slug, category and/or tags.  If you set the `Status: draft` directive in a post file, the post isn't published.  The slug may contain folder names — for example, `Slug: 2012/01/20/zomg` will result in the URL `[username].calepin.co/2012/01/20/zomg/`.  I like that.

The publish process is triggered by clicking the aptly named "Publish" button on calepin.co.


### But…

Calepin is not themeable.  It also lacks support for extra header/footer links, "special" pages, widgets or doodads (yet?).  For me, that's not a problem (yet?), tho, since I noticed I can get clever using a page's `Slug` directive.

(For example, I wanted a "Me" page: I created a file `me.md`, then set its slug to "me" and its post date in the future (so the page will stay at the top of the front page).  For the time being, this works well enough for me.  YMMV.)

There's no timezone support yet, at this point all timestamps are UTC.


### The future

Calepin's creator, [Jökull Sólberg Auðunsson][jokull], made some statements regarding future features etc. in the comments to the [Calepin Guide][guide].

* There might be additional customization options like footer sections or subpages.
* A command-line tool is "coming soon".
* Calepin might transform into a freemium/premium service at some point.  It'll be interesting to follow that development.


### And finally…

My new/old/moved blog is back at [carlo.zottmann.org][blog-new].  This is where it resided back in its Wordpress days (self-hosted), its Tumblr incarnation was located at [blog.zottmann.org][blog-old].

On a related note, I think [iA Writer][iawriter]'s lack of full Markdown syntax highlighting (for example, for links and italic text) might turn out to annoy me more than I had anticipated.


[tumblr-switch]: http://carlo.zottmann.org/2009/10/14/the-big-blog-move-of-2009
[iawriter]: http://www.iawriter.com/
[tumblr-exporter]: http://www.tumblr.com/goodies
[html2text]: https://github.com/aaronsw/html2text
[jekyll]: http://jekyllrb.com/
[calepin]: http://calepin.co/
[disqus]: http://disqus.com/
[yaml-fm]: https://github.com/mojombo/jekyll/wiki/yaml-front-matter
[jokull]: http://jokull.calepin.co/
[guide]: http://jokull.calepin.co/calepin-guide.html
[blog-new]: http://carlo.zottmann.org/
[blog-old]: http://blog.zottmann.org/
