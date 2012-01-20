Title: Assorted MacRuby Snippets #2
Date: 2010-02-17 12:13:39
Slug: 2010/02/17/assorted-macruby-snippets-2
Tags: xcode, code, macruby, ruby, snippets, apple, osx


_This post references [MacRuby][1] 0.5, used with Xcode 3.2 on Snopard
(10.6.2); the general technique will likely work on other OS/Xcode version,
tho. Just saying._

### Apps with more than just one framework

The standard MR app template massages `$LOAD_PATH` a bit in order to have apps
which embed the MR framework use said embedded framework in Release builds.
The piece of code in question looks like this:

    if Dir.exist?(NSBundle.mainBundle.privateFrameworksPath)
      $:.map! { |x| x.sub(/^\/Library\/Frameworks/, NSBundle.mainBundle.privateFrameworksPath) }
      $:.unshift(NSBundle.mainBundle.resourcePath.fileSystemRepresentation)
    end

Which is quite alright if all you embed is the MacRuby framework and are
building a release. But as soon as you add another one ([Sparkle][2], for
example), the test will always be true, whether you're debugging without
embedding MR or not, and your console will show Ruby load errors. The fix is
easy, but it took me a few minutes to find the issue, so here we go.

    if Dir.exist?( File.expand_path("MacRuby.framework", NSBundle.mainBundle.privateFrameworksPath) )
      $:.map! { |x| x.sub(/^\/Library\/Frameworks/, NSBundle.mainBundle.privateFrameworksPath) }
      $:.unshift(NSBundle.mainBundle.resourcePath.fileSystemRepresentation)
    end

Just a heads-up: the `rb_main.rb` template in the current MR nightlies doesn't
contain the code above anymore -- it appears the "magic" was moved into
`macruby_deploy` ([changeset][3]), so it's likely my fix will be unnecessary
in MR 0.6.

   [1]: http://macruby.org
   [2]: http://sparkle.andymatuschak.org/
   [3]: http://www.macruby.org/trac/changeset/3528/MacRuby/trunk/bin/ruby_deploy
