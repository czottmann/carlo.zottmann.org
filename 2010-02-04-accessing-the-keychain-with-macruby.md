Title: Accessing the Keychain with MacRuby
Date: 2010-02-04 18:52:00
Slug: 2010/02/04/accessing-the-keychain-with-macruby
Tags: macruby, keychain, osx, apple, code, xcode, obj-c, howto


_This post references [MacRuby][1] 0.5, used with Xcode 3.2 on Snopard
(10.6.2); the general technique will likely work on other OS/Xcode version,
tho. Just saying._

At some point in [my project][2] I needed to access OSX' Keychain to store
sensitive userdata. Unfortunately, due to the lack of void pointers in MacRuby
0.5 (see [Trac ticket][3]), I couldn't use standard methods like
[`SecKeychainAddGenericPassword`][4]. The guys on [the mailing list][5] told
me to use a wrapper instead. Doing some reading and poking around the
interwebs I finally figured it out, and since it's a neat trick I thought I'd
scribble it down, so maybe it will safe someone in a position like me a bit of
time. ;)

I've decided to go with [ExtendMac's EMKeychain class][6] because it's simple,
clean, free and has a liberal license (MIT license, if I'm not mistaken).

**Disclaimer: I'm not a Obj-C person, and what you're about to read is what works for me. I've tinkered until everything was moving in the right direction. There might be better ways (I'm pretty sure there are), and if what I've done here is bollocks, I'd be delighted if you would share your knowledge with me. :)** Also, I'd enjoy a comment with your thoughts about this here article. Any opinion will do. Just curious is all.

### Step 1: Build the wrapper, `EMKeychain.dylib`

First, we'll have to make EMKeychain into a dynamic library. Download it from
the site, unzip it, and fire up Xcode. There, start a new project of the type
"Cocoa Library".

![Starting a new project of the type "Cocoa Library"][7]

When asked for the name, call it "EMKeychain". It kind of makes sense. This is
what you'll end up with:

![New project view][8]

In the screenshot you'll notice a file called `EMKeychain_Prefix.pch`. That's
a so-called "precompiled header"; Xcode creates it automatically for you on
project creation.

Next, add the files `EMKeychain.m` and `EMKeychain.h` to your project by
dragging them from the download folder to the "Classes" folder.

![Two files added to the project][9]

Since the EMKeychain documentation said the class needs to be linked against
Carbon and Security frameworks, do that by right-clicking on the "Linked
Frameworks" folder in the tree and selecting _Add Existing Frameworks…_:

![The linked frameworks show up in my project][10]

Following the related [MacRuby tutorial][11]'s advice, add a constructor to
the end of `EMKeychain.m`:


    void Init_EMKeychain(void) { }


Next, adjust the build settings -- switch the base SDK to 10.5…

![Base SDK set][12]

… and enable GC.

![GC enabled][13]

Build a release, and you'll have your wrapper.

### Step 2: Using it

Now for the fun part.

  1. Add the just built `EMKeychain.dylib` to your MacRuby project. (Don't forget to copy the file over.)
  2. Add `EMKeychain.dylib` to _Targets ➔ [project name] ➔ Copy Bundle Resources_.

And that's it. **If all went well, you should now be able to use EMKeychain's
`EMGenericKeychainItem`.**

### Step 3: Mopping up

It's very likely that when running your release build it'll crash and burn and
complain about a missing `/usr/lib/EMKeychain.dylib`. In this case, you'll
have to adjust the built executable accordingly using
[`install_name_tool`][14].

You can do that by adding a new _Run Script_ build phase to the target, which
should contain this code.


    install_name_tool -change /usr/lib/EMKeychain.dylib \
      "@executable_path/../Resources/EMKeychain.dylib" \
      "$TARGET_BUILD_DIR/$PROJECT_NAME.app/Contents/MacOS/$PROJECT_NAME"


It's possible that on the next build the executable will mope about a missing
`/usr/local/lib/EMKeychain.dylib` now. Duplicate the snippet and adjust the
second one accordingly.

### Step 4: Get yourself a beer

Because if all went according to plan, you're done. :)

   [1]: http://macruby.org
   [2]: http://goephemera.com/
   [3]: http://www.macruby.org/trac/ticket/573
   [4]: http://developer.apple.com/mac/library/DOCUMENTATION/Security/Reference/keychainservices/Reference/reference.html#//apple_ref/c/func/SecKeychainAddGenericPassword
   [5]: http://www.mail-archive.com/macruby-devel@lists.macosforge.org/info.html
   [6]: http://extendmac.com/EMKeychain/
   [7]: http://dl.dropbox.com/u/7298/blog/370827421_1.png
   [8]: http://dl.dropbox.com/u/7298/blog/370827421_2.png
   [9]: http://dl.dropbox.com/u/7298/blog/370827421_3.png
   [10]: http://dl.dropbox.com/u/7298/blog/370827421_4.png
   [11]: http://www.macruby.org/recipes/create-an-objective-c-bundle.html
   [12]: http://dl.dropbox.com/u/7298/blog/370827421_5.png
   [13]: http://dl.dropbox.com/u/7298/blog/370827421_6.png
   [14]: http://developer.apple.com/Mac/library/documentation/Darwin/Reference/ManPages/man1/install_name_tool.1.html
