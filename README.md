modules
=======
XP Module management experiment

Prerequisites
--
Clone this repostory

```sh
$ cd devel
$ git clone git://github.com/thekid/modules.git
```

Add the "modules" directory to your use path. An example **xp.ini**:

```ini
use=~/devel/xp.thekid.core/core;~/devel/xp.thekid.core/tools;~/devel/modules
```

Usage
-- 
**Adding** a module is done by using the "add" command and supplying vendor and repository. We use "xp-forge" and "gsa-xmlfeed" in the following example:

```sh
$ ./module add  xp-forge/gsa-xmlfeed
===> Checkout xp-forge/gsa-xmlfeed
Cloning into gsa-xmlfeed...
remote: Counting objects: 185, done.
remote: Compressing objects: 100% (60/60), done.
remote: Total 185 (delta 29), reused 180 (delta 27)
Receiving objects: 100% (185/185), 16.97 KiB, done.
Resolving deltas: 100% (29/29), done.
```

The module is now added to the XP Framework's class path, as can be seen by typing `xp -v`.

**Updating** your modules can be performed either one-by-one, or all at once, using the "update" command. This will pull in changes from GitHub:

```sh
# A single module 
$ ./module update xp-forge/gsa-xmlfeed
===> Updating xp-forge/gsa-xmlfeed
Already up-to-date.

# All modules
$ ./module update
===> Updating xp-forge/google-search
Already up-to-date.
===> Updating xp-forge/gsa-xmlfeed
Already up-to-date.
===> Done, 2 module(s) updated, 0 error(s)
```

**Removing** a module is done by using the "remove" command

```sh
$ ./module remove xp-forge/google-search
```
