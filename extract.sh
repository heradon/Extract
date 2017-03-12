#!/bin/sh

# function extract from common file extensions

function extract {
  if [ -z "$1" ]; then
      echo "Usage: extract </path/to/file>.<zip|rar|bz2|tar|gz|tbz2|tgz|Z|7z|xz|exe|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f "$1" ]; then
      local nameInLowerCase=`echo "$1" | awk '{print tolower($0)}'`
      case "$nameInLowerCase" in
	*.zip)	   tar xvjf ./"$1"	  ;;
	*.rar)	   unrar x -ad ./"$1"	  ;;
	*.bz2)	   bunzip2 ./"$1"	  ;;
	*.tar)	   tar xvf ./"$1"	  ;;
	*.gz)	   gunzip ./"$1"	  ;;
	*.tbz2)	   tar xvfj ./"$1"	  ;;
	*.tgz)	   tar xvzf ./"$1"     	  ;;
	*.Z)	   uncompress ./"$1"	  ;;
	*.7z)	   7z x ./"$1"		  ;;
	*.xz)	   unxz ./"$1"		  ;;
	*.exe)	   cabextract ./"$1"	  ;;
	*.tar.bz2) tar xvjf ./"$1"	  ;;
	*.tar.gz)  tar xvzf ./"$1"	  ;;
	*.tar.xz)  tar tar xvJf ./"$1"	  ;;
	*)	   echo "extract: '$1' - unknown archive extension" ;;
      esac
    else
      echo "'$1' - file does not exist"
    fi
  fi
}
