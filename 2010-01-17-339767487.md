Title: Assorted MacRuby Snippets
Date: 2010-01-17 23:33:00
Slug: 2010/01/17/assorted-macruby-snippets
Tags: applescript, code, macruby, ruby, snippets, xml, xpath, apple, osx


Some things I've learned or discovered during the last few days. Nothing
special, but taking notes is usually a good idea, so there.

### Get values from`Info.plist`

For example, app name and version:


    info = NSBundle.mainBundle.infoDictionary
    info.objectForKey("CFBundleName")
    info.objectForKey("CFBundleVersion")


### Open an URL in the default browser:


    url = NSURL.URLWithString("http://municode.de/")
    NSWorkspace.sharedWorkspace.openURL(url)


### Run an AppleScript

Sometimes you want to execute a short AppleScript snippet to save yourself
some time by using the higher-level functionality AS offers instead of writing
a huge block of MacRuby. (For example, to eject a FS volume.) Here's how you
do it (the AS is deliberately simple):


    script = "display dialog (\"omg\")"
    pnt = Pointer.new_with_type("@")
    as = NSAppleScript.alloc.initWithSource(script)
    as.executeAndReturnError(pnt)


More info at [developer.apple.com][1].

### Delete nodes/tags from an XML document

Let's say you have a variable `doc` which represents a `NSXMLDocument`, and
you want to remove all `em` and `cite` tags:


    error = Pointer.new_with_type("@")
    selectors = [ "//em", "//cite" ].join("|")
    doc.nodesForXPath( selectors, error: error ).each do |n|
      n.detach
    end


More notes might follow at a later date. :)

   [1]: http://developer.apple.com/mac/library/technotes/tn2006/tn2084.html
