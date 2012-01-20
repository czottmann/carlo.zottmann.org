Title: Excellent Localmemcache
Date: 2009-10-09 09:16:53
Slug: 2009/10/09/excellent-localmemcache
Tags: code, community, en, münchen, meetups, ruby, ruby on rails


Yesterday's [Munich on Rails][1] meetup was the usual mix of interesting talks
and geeky, delightful conversations. When I say "usual", I of course mean it's
been the kind of evening I by now kind of expect. ;) Many thanks to
[Roland][2] for organizing and the [Experteers guys][3] for the venue and the
food. Nom!

Anyways: interesting talks.

[Marco Otte-Witte][4] presented his [Excellent][5] gem (gotta love the name)
for static code analysis. It's mostly aimed towards checking Rails code for
smell, although —and he made that clear— it's not targetted at people who
strive for the blissful state of "zero warnings". It's more relaxed in that
way; merely showing you unusual (or stupid or silly) parts of your code, such
as missing validations in your models or having instance variables in your
partials and the likes. Sadly, at the moment it's not dealing with HAML
templates yet, just ERB. (He's looking for volunteers, by the way.;)) Here are
[the slides][6]:

I can actually see myself using it.

And then Sven C. Koehler presented his somewhat irritatingly named [^1] yet
spiffy [Localmemcache][8]. It's a local, shared-memory-based, persistent
key/value store, which looks pretty fascinating. I was a wee bit confused by
it until it finally clicked — you wouldn't be able to tell from its name, but
it's _not_ related to [memcached][9]. Aha! It's a C library with Ruby bindings
which offers a more or less simple storage system (values are of the type
`String`, but of course that would include `Marshal`'ed data) and apparently
blazingly fast — his benchmarks showed that Localmemcache is almost as fast as
accessing native Ruby hashes. Its not for everyone —for example, as I
understand, it requires a 64-bit Unix system— but it looks like a pretty
interesting alternative to memcached for single-machine setups like, say, your
single production machine or your local dev box. This should ease the issue of
sharing data between different Ruby processes, for example. I'm definitely
going to check that out.

Oh, and [Peter Schrammel][10] presented a concept for a truly private asset
server. As I'm not entirely sure whether this is really public information
yet, I'll keep my yapper shut here. :)

Afterwards we all headed to the [Park Café][11] for conversations and drinks.
All in all a very nice evening, even though I was still a bit groggy from the
day before — the [München Twittwoch][12]. (Which reminds me, I should probably
whip up a quick post about that as well. Eh.)

Again: my thanks go to the MoR organizers and all the people who showed up, I
had a good time. :)

**Update:** [Artikel von Marco zu Excellent auf RailsMagazin.de][13]


[^1]: To me, at least. Sorry, Sven. :)

   [1]: http://munich-on-rails.com
   [2]: http://moriz.com
   [3]: http://experteer.de
   [4]: http://simplabs.com/
   [5]: http://github.com/simplabs/excellent
   [6]: http://www.slideshare.net/marcoow/excellent-2173489
   [7]: #fn:p210093648-1
   [8]: http://github.com/sck/localmemcache
   [9]: http://www.danga.com/memcached/
   [10]: http://www.workingwithrails.com/person/14317-peter-schrammel
   [11]: http://parkcafe089.de
   [12]: http://blog.clipflakes.com/2009/10/08/clipflakestv-prasentiert-twittwoch-in-munchen/
   [13]: http://railsmagazin.de/excellent-statische-analyse-fur-ruby-und-rails-1444
   [14]: #fnref:p210093648-1
