Title: Wordpress Woes and WTFs
Date: 2006-11-25 15:27:43
Slug: 2006/11/25/wordpress-woes-and-wtfs
Tags: code, hacking, php, syndication, wordpress, xml


Well, the [decision has been made][1]—it certainly feels weird.

The nice (?) side effect is my newly written [Wordpress importer for RSS 2.0
and Blogcomments Module support][2] (catchy name). Download it, put it in your
WP root folder in /wp-admin/import/ and rename it to
rss_2_plus_blogcomments.php. Then run the import from your WP dashboard,
that’s all there is to do. Use it, abuse it, spread it, have fun.

Which reminds me: why is the original WP 2.0 RSS importer so freaking
braindead?! And people—XML parsing with _regular expressions_? As part of the
official WP package? Give me a break, really. This isn’t 1996, bloody hell.

So the new importer uses PHP5 and SimpleXML. It is still very much a hack job,
but at least it’s clean and can deal with CDATA.

   [1]: http://g-blog.net/user/Gossip/entry/32686
   [2]: http://docs.g-blog.net/code/wordpress/rss_2_plus_blogcomments.phps
