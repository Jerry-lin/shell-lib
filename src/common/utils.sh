#! /bin/sh

# utils.sh
# created at 2015-02-27 by jerry.lin
# version 0.1


###### avoid from re-include
if [ "$_UTIILS_SH_" ]; then
  return
fi
export _UTIILS_SH_="utils.sh"

###### functions

# get the host os type
# example:
# if [ "LINUX" = "`get_os_type`" ]; then
#   echo "the host os is LINUX"
# elif [ "OSX" = "`get_os_type`" ]; then
#   echo "the host os is OSX"
# fi
#
function get_os_type() {
  case "$OSTYPE" in
    solaris*) 
      echo "SOLARIS"
      ;;
    darwin*)  
      echo "OSX"
      ;; 
    linux*) 
      echo "LINUX" 
      ;;
    bsd*)
     echo "BSD" 
     ;;
    *)
     echo "unknown: $OSTYPE"
     ;;
  esac
}


# send notified by email 
# $1 context
# $2 subject
# $3 recivers: sample@xxx.com sample2@xxx.com sample3@xxx.com
function send_mail() {
  if [ $IS_DVE_DEBUG -ne 0 ]; then
    echo $@; return 0
  fi
   #echo "hell test shell mail" | mail -s "test2 e-mail from mac" "jie.lin@ttpod.com"
   echo "$1" | mail -s "$2 " "$3"
}

