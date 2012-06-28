git extras
==========

A few git extras.

Add the `git-extras` directory to your `PATH`:

    export PATH=$PATH:~/git-extras

The git extras commands can be used like any other git command.

E.g. to show the incoming changes use:

> git incoming

To show the outgoing changes:

> git outgoing


List of commands:

* git-incoming -> Show incoming changes (will fetch changes from the remote)
* git-outgoing -> Show the changes about to be pushed to the remote
* git-filesize-history -> Show the filesize history of a single file in the
  repository
* git-find-blob -> Given a blob id (SHA1), list the commits that contain the
  blob
* git-sync-local-tags -> Delete local tags that don't exist in the remote
  anymore
