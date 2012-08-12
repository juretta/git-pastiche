git pastiche
============

A few git things.

Installation
============

In order to use the git-pastiche scripts as new subcommands with git, 
they need to be available in your PATH.

Option 1
--------

Add the `git-pastiche` directory to your `PATH`:

    export PATH=$PATH:~/git-pastiche/bin

The additional git commands can be used like any other git command.

E.g. to show the incoming changes use:

    git incoming

To show the outgoing changes:

    git outgoing



Option 2
--------

Use the Makefile to copy the scripts to your `/usr/local/bin` directory.
This will also copy the man pages to the appropriate directories on your
system.

    make install

To remove the scripts and man pages run `uninstall`:

    make uninstall

Commands
========

* `git incoming` -> Show incoming changes (will fetch changes from the remote)
* `git outgoing` -> Show the changes about to be pushed to the remote
* `git filesize-history` -> Show the filesize history of a single file in the
  repository
* `git find-blob` -> Given a blob id (SHA1), list the commits that contain the
  blob
* `git sync-local-tags` -> Delete local tags that don't exist in the remote
  anymore
