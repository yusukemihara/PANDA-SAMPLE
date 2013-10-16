#!/bin/sh

DBNAME='address'
INSERT_FILES='
insert.sql 
'

set -ex

dir=`dirname $0`
psql $DBNAME -c "\d" \
| awk '/table/ {print $3}' \
| xargs --no-run-if-empty -n 1 \
    sh -c "psql $DBNAME -c \"drop table \$0\""
psql $DBNAME -f $dir/create.sql
for f in $INSERT_FILES; do
    if test -e $dir/$f; then
        psql $DBNAME -f $dir/$f
    fi
done
