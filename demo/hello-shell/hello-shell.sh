#! /bin/sh


###### current path
bin=`dirname $0`
bin=`cd $bin; pwd`

###### path

# needed variable
export COMMON_DIR=$bin/../../src/common

bin=`cd "$bin"/..; pwd`

###### includes
. $COMMON_DIR/log_utils.sh


###### functions


###### variables
data_path=$bin/data
log_path=$bin/log
lib_path=$bin/lib



###### main

log_info hello shell
log_warn "hello shell"
log_error hello shell


