Title: How to set up SpamBayes for your Dreamhost mail account
Date: 2004-04-28 18:02:41
Slug: 2004/04/28/how-to-set-up-spambayes-for-your-dreamhost-mail-account
Tags: code, dreamhost, en, hacking, howto, python, spam, spambayes


Okay, so you want to use SpamBayes on your mail server in order to enjoy
working with your webmail or IMAP again. Here's how to do it.

  * Your DH mail account needs to have shell access.
  * Install the latest [Python][1] in your `$HOME` directory.
  * Install [SpamBayes][2] (I recommend the CVS version as the official/stable builds wouldn't install for me) as described in the paragraph "Procmail" on the linked page.
  * Using your webmail interface or IMAP, set up the following new folders: `Spam`, `TrainingHam`, `TrainingSpam`, `Unsure`.
  * Write the following code to a file named `.procmailrc`:

    # ~/.procmailrc for Dreamhost
    # Uses Maildir format mail directory.

    ## Directory for storing procmail-related files
    PMDIR=$HOME/.procmail

    ## Set to yes when debugging
    # VERBOSE=yes
    # Logging
    # LOGFILE=$PMDIR/log

    ## Remove # when debugging; set to no if you want minimal logging
    # LOGABSTRACT=all

    # Message directory (Courier IMAP and mutt)
    MAILDIR=$HOME/Maildir

    :0 fwr:hamlock
    | $HOME/bin/sb_filter.py


    # Messages that are so obviously spam that we should not train on them
    # are put in the Spam folder.
    # (Once the training has proceeded long enough, you might want to change
    # the recipient folder to /dev/null in order to delete the spam that
    # scored 1.0 right away.)
    :0
    * ^X-SpamBayes-Classification: spam; 1.00
    .Spam/

    # Messages that are so obviously spam that we should not train on them
    :0
    * ^X-SpamBayes-Classification: spam; 0.9[5-9]
    .Spam/


    # Messages that are spam but we might want to train on them are copied
    # to the TrainingSpam folder, the original remains in the inbox
    :0 c
    * ^X-SpamBayes-Classification: spam
    .TrainingSpam/


    # Unsure messages must be copied to the unsure folder for training
    :0 c
    * ^X-SpamBayes-Classification: unsure
    .Unsure/


    # Ham that doesn't score 0.00 is eligible for training as well
    :0 c
    * ^X-SpamBayes-Classification: ham; 0.0[2-9]
    .TrainingHam/

    :0 c
    * ^X-SpamBayes-Classification: ham; 0.1[0-9]
    .TrainingHam/


    # Folder names for use in recipes should be of form '.Foo/' for Maildir format

    ### INCLUDERC=$PMDIR/spam.rc
    # INCLUDERC=$PMDIR/testing.rc

    # Anything that hasn't been filtered yet is delivered to your inbox by this
    # recipe.  The '/' at end of pathname indicates a Maildir format mailbox
    :0
    $HOME/Maildir/


  * Write the following line to a file named `.cronjob`:

`21 15 * * * $HOME/bin/sb_mboxtrain.py -d $HOME/.hammiedb -g
$HOME/Maildir/.TrainingHam -s $HOME/Maildir/.TrainingSpam >>
$HOME/cronjob_sb_mboxtrain.log`

  * Do a `crontab .cronjob` to install the cronjobs.

That's it: You're basically done!

What does this setup do?

  1. Every incoming mail is scanned by SpamBayes.
  2. If it's definitely spam, it's moved out of your inbox to the `Spam` folder.
  3. If it's most likely spam, it'll remain in your inbox, and a copy is placed in the `TrainingSpam` folder for learning purposes.
  4. If it's most likely ham (good mail), it'll remain in your inbox, and a copy is placed in the `TrainingHam` folder for learning purposes.
  5. If SpamBayes can't tell what it is, a copy is placed in the `Unsure` folder.
  6. Good mail is kept in the inbox.
  7. Once per night the cronjob (scheduled automatic task) is training your SpamBayes database with the contents of the `TrainingHam` and `TrainingSpam` folders.

The first couple of days or weeks you might have to do some manual sorting in
order to train SpamBayes to tell good from bad; if you have spam in your
inbox, you move it to the folder `TrainingSpam`. If your `Spam` folder or
`TrainingSpam` contain good mails (ham), move those to `TrainingHam`. If there
is mail in the "Unsure" folder, SpamBayes isn't sure whether it's spam or ham,
so you have to sort the mails to one of the two training folders yourself.

The initial training can be a bit tiresome, but after a relatively short
period of time you'll enjoy a spam free inbox again. By now it works so well
for me and Dana that we don't run spam filters in our desktop mail clients
anymore. We just don't need them anymore. :)

A little shortcut for the initial training: connect to your mailbox via IMAP
and copy all the old spam mails from your desktop clients to the
`TrainingSpam` folder on the server. I did that with a couple of hundreds spam
mails, and that sped up my initial training quite remarkably. ;) Also, once
your account is trained, and you want to repeat your success on another mail
account, you can copy the file `.hammiedb` (which is all the training data) to
the new account once you have set up everything there. :)

Have fun, and good luck.

Questions?

   [1]: http://www.python.org
   [2]: http://spambayes.sourceforge.net/unix.html
