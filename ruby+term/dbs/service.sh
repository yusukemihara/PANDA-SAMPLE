#!/bin/bash

DBS=/usr/lib/panda/sbin/dbs
LOG=log.txt

case "$1" in
    start)
		$DBS -dir directory dbs -noredirect -nocheck -auth file:///`pwd`/passwd > $LOG 2>&1 &
        ;;
    stop)
		killall dbs
        $0 clean
        ;;
    clean)
        rm -f ${LOG}
        echo "done."
        ;;
    *)
        echo "Usage: init {start|stop|clean}" >&2
        exit 1
        ;;
esac

# Local Variables:
# mode: shell-script
# indent-tabs-mode: nil
# End:
