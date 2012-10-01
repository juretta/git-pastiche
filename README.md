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
=========

* `git activity` -> Show the recent activity on each ref
* `git filesize-history` -> Show how the filesize changed for a given PATH
* `git find-blob` -> Find the commits that contain the given object id
* `git incoming` -> Show new changesets in the remote
* `git outgoing` -> Show local changesets not on the remote
* `git stats` -> Show repository statistics
* `git sync-tags` -> Delete local tags that have been removed in the remote
