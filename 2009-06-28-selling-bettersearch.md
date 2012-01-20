Title: Selling BetterSearch
Date: 2009-06-28 11:34:00
Slug: 2009/06/28/selling-bettersearch
Tags: addons, announcements, bettersearch, en, firefox


Since its birth a few years ago, my Firefox addon [BetterSearch][1] has been a
fun project. People were using it and seemed mostly happy with it, as they
could see a thumbnail of the search results on their favourite search engine
before actually clicking through. Good times.

![BetterSearch screenshot][2]

This was made possible by displaying preview thumbnails from various sources,
such as Amazon's Alexa service and several others. These thumbnails had to be
bought from them, which was financed by money I made as an Amazon affiliate.
When BetterSearch would find an Amazon product in the list of search results,
it would not display the Amazon.com thumbnail but the actual product image,
along with the price, average rating and related information. When a user
would click through, and buy stuff from them, I (as their affiliate) would get
a few cents. [^1]

This worked out well. It paid for server, bandwidth and thumbnails, and yes,
I've made some extra money from it. Not much, but a bit.

Then, around end of 2008, Amazon changed the terms of their affiliate program
-- all of a sudden, what BetterSearch (and several other addons for different
browsers) were doing wasn't allowed anymore. No more tagging of so-called
"organic search results". Oh noes! The Amazon partner program-related code had
to go.

This put me in a somewhat tough spot. On the one hand, I liked my addon, and I
know a lot of people were using it on a daily basis. On the other hand, it was
just a side project, and the only source of income to counter the costs had
suddenly dried up — and to be honest, as much as I like BetterSearch, it's
nothing I was willing or able to invest lots of money in just for the fun of
it.

But luckily, the company of a former co-worker of mine was looking for
something like BetterSearch. They were interested in buying the addon, and we
came to an agreement.

### What does that mean?

**It means BetterSearch, the Firefox addon, is now owned by
[Abakus Internet Marketing][4].** They will continue to develop it, they will
run its servers, pay for the bandwidth and the thumbnails — in a nutshell,
everything BetterSearch is theirs now.

For the end user, not much will change — apart from a vastly expanded number
of available thumbnails, that is. Firefox will update the addon whenever
there's a new version, the way it was before. No need to manually install or
adjust anything.

### What's not part of the deal

**No user-related data was passed along.** First and foremost, BetterSearch
didn't collect any user data. But of course there's always the case of the
thumbnail server logfiles. Everytime a thumbnail is requested, it's noted in
a server logfile, along with the user's IP address. (That's the _modus
operandi_ for pretty much every server everywhere on the internet. Ask your
local geek about the details.) Since I don't care about this stuff, these
logfiles were deleted on a daily basis anyone looking at them.

Either way, these server log files were not part of the deal.

### The future

I think the addon's future is a bit brighter now as it was a few months ago.
Now there's someone with sufficient resources to maintain and further develop
BetterSearch. To me, that's a good thing. :)


[^1]: Some people think it is "amoral" to tag Amazon links in such a way, and
      claimed it was sneaky. I disagree with both points. For me, it added
      meaning and context to the Amazon search results. And the information
      that this was done was disclosed on the addon's website, it's
      [AMO page][1] and in the addon's preferences dialog. Everybody using the
      addon _decided_ to use it. Free will and all that. So there.

   [1]: https://addons.mozilla.org/en-US/firefox/addon/211/
   [2]: http://dl.dropbox.com/u/7298/blog/wp-content/2009/06/1218984718-300x217.jpg (BetterSearch screenshot)
   [3]: #fn:p210093582-1
   [4]: http://www.abakus-internet-marketing.de/
   [5]: #fnref:p210093582-1
