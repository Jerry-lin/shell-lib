#! /bin/sh

# log_utils.sh
# print logs
# created at 2015-02-27 by jerry.lin
# version 0.1

###### avoid from re-include
if [ "$_LOG_UTIILS_SH_" ]; then
  return
fi
export _LOG_UTIILS_SH_="log_utils.sh"


###### check variable path
if [ ! -d "$COMMON_DIR" ]; then
  echo " [error] var COMMON_DIR was not been set."
  exit 1
fi

###### includes
. $COMMON_DIR/time_utils.sh


###### functions


# print success log
function log_success() {
  log " [success] $@"
}

# print warning log
function log_warn() {
  log " [warn] $@"
}

# print info log
function log_info() {
  log " [info] $@"
}

# print error log
function log_error() {
  log " [error] $@"
}

# base log printer
function log() {
  echo "`now_date` $@"
}
