#! /bin/sh

# time_utils.sh
# date and time utils
# created at 2015-02-27 by jerry.lin
# version 0.1

###### avoid from re-include
if [ "$_TIME_UTIILS_SH_" ]; then
  return
fi
export _TIME_UTIILS_SH_="time_utils.sh"


###### functions

# get date of today with format yyyy-mm-dd
function get_today() {
  echo `date +%Y-%m-%d`
}

# get date of yesterday with format yyyy-mm-dd
function get_yesterday() {
  case "$OSTYPE" in
    darwin*)  
      echo `date -v -1d '+%Y-%m-%d'`
      ;; 
    linux*)   
      echo `date --date='yesterday'  "+%Y-%m-%d"`
      ;;
    *)
      echo "unsupported os type: $OSTYPE"
      ;;
  esac
}

# get date of yesterday with format yyyy-mm-dd
function get_tomorrow() {
  case "$OSTYPE" in
    darwin*)  
      echo `date -v +1d '+%Y-%m-%d'`
      ;; 
    linux*)   
      echo `date --date='tomorrow'  "+%Y-%m-%d"`
      ;;
    *)
      echo "unsupported os type: $OSTYPE"
      ;;
  esac
}

# get the date of n days before the asigned day
# $1 the day
# $2 n days before
function get_before_date() {
  case "$OSTYPE" in
    darwin*)  
      secs=$(change_to_secs $1)
      echo `date -r $secs -v -$2d '+%Y-%m-%d'`
      ;; 
    linux*)   
      echo `date -d "-$2 day $1" +%Y-%m-%d`
      ;;
    *)
      echo "unsupported os type: $OSTYPE"
      ;;
  esac
}


# get the date of n days after the asigned day
# $1 the day
# $2 n days after
function get_after_date() {
  case "$OSTYPE" in
    darwin*)  
      secs=$(change_to_secs $1)
      echo `date -r $secs -v +$2d '+%Y-%m-%d'`
      ;; 
    linux*)   
      echo `date -d "$2 day $1" +%Y-%m-%d`
      ;;
    *)
      echo "unsupported os type: $OSTYPE"
      ;;
  esac
}


# check if the date format is YYYY-MM-DD
# $1 date
function valid_date(){
  ret=1
  case "$OSTYPE" in
    darwin*)  
      date -j -f "%Y-%m-%d" "$1" "+%Y-%m-%d" | grep -q "$1" 2>/dev/null
      ret=$?
      ;; 
    linux*)   
      date -d "$1" "+%F" | grep -q "$1" 2>/dev/null
      ret=$?
      ;;
    *)
      echo "unsupported os type: $OSTYPE"
      ;;
    esac

   return $ret
}

# change date format from YYYY-MM-DD to yyyyMMdd
# $1 YYYY-MM-DD
function change_to_yyyyMMdd() {
   echo `echo $1 | awk -F "-" '{ printf "%s%s%s", $1, $2, $3 }' `
}

# change YYYY-MM-DD to seconds that from 00:00:00 UTC, January 1, 1970;
# $1 YYYY-MM-DD
function change_to_secs() {
  case "$OSTYPE" in
    darwin*)  
      echo `date -j -f "%Y-%m-%d %T"  "$1 00:00:00" "+%s"`
      ;; 
    linux*)   
      echo `date -d "$1" "+%s"`
      ;;
    *)
      echo "unsupported os type: $OSTYPE"
      ;;
  esac
}

# +%Y-%m-%d %T 2015-02-06 15:52:24
function now_date() {
  echo `date "+%Y-%m-%d %T"`
}

# get timestamp: seconds since 1970-01-01 00:00:00 UTC
function now_ts() {
  echo `date +"%s"`
}

# time cost
# $1 start
# $2 end
function time_cost() {
  echo `expr $2 - $1`
}
