#!/bin/bash
# Metis - A Divine Solution for Aliases
# by Stephen Coley @coleydotco 2012

## Install ##

# %> git clone git://gist.github.com/1730076.git
# 
# Initialized empty Git repository in ~/1730076/.git/
# remote: Counting objects: 25, done.
# remote: Compressing objects: 100% (17/17), done.
# remote: Total 25 (delta 7), reused 0 (delta 0)
# Receiving objects: 100% (25/25), done.
# Resolving deltas: 100% (7/7), done.
# 
# %> cat 1730076/metis.sh >> path/to/your/.dotfile; .path/to/your/.dotfile
#
# That's it

## Metis 0.2 Commands ##

# metis - asks which dotfile to save to / displays all aliases saved with Metis
# metis <alias_name> - creates an alias that will cd to the current working dir
# metis use <path/to/dotfile> - change the path to the dotfile Metis saves to
function metis() {
   # This var is broken into parts to prevent grep from recognizing it 
   var1="met"
   var2="alias"
   export VAR3="$var1$var2"
   # if .metisfile exists
   if [ -f ~/.metisfile ]
   then
      # Set var equal to user settings 
      export METISOPT=`head -1 ~/.metisfile`
   # Create settings file and set var equal to setting 
   else 
      echo "Which file should metis manage? Provide full path. e.g. ~/.bashrc, ~/.bash_profile, ~/.profile.."
      `touch ~/.metisfile`
      read thepath
      ex_path=`eval "echo $thepath"`
      echo $ex_path >> ~/.metisfile
      export METISOPT=`eval "echo $thepath"`
   fi
   # if $1 is "use"
   if [ "$1" == "use" ]
   then
      # if $2 exists
      if [ -f $2 ]
      then
         # Updates setting 
         `rm -f ~/.metisfile`
         `touch ~/.metisfile`
         # make alias for the file metis will be using
         echo `eval "echo $2"` >> ~/.metisfile
         export METISOPT=`eval "echo $2"`
      # else print error
      else
         echo "Second argument must contain path to a file that exists"
      fi
   # else if $1 is set
   elif [ $1 ]
   then
      # append alias command to .bashrc
      echo "alias $1='cd $PWD' #$VAR3" >> "$METISOPT"
      # source .bashrc to reflect changes
      . $METISOPT
   # else print all aliases
   else
      grep $VAR3 $METISOPT
   fi
}
