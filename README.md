metis
=====

A command line tool that helps make and remember aliases.

Install
-------

```
%> git clone git://github.com/srcoley/metis.git

Initialized empty Git repository in ~/1730076/.git/
remote: Counting objects: 25, done.
remote: Compressing objects: 100% (17/17), done.
remote: Total 25 (delta 7), reused 0 (delta 0)
Receiving objects: 100% (25/25), done.
Resolving deltas: 100% (7/7), done.

%> cat 1730076/metis.sh >> path/to/your/.dotfile
%> .path/to/your/.dotfile
```

That's it

Metis 0.2 Commands
------------------

`metis` - asks which dotfile to save to / displays all aliases saved with Metis.

`metis <alias_name>` - creates an alias that will cd to the current working dir.

`metis use <path/to/dotfile>` - change the path to which Metis saves aliases.