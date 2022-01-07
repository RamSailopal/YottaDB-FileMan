#!/bin/bash
source $(pkg-config --variable=prefix yottadb)/ydb_env_set
if ! test -f /var/log/lsyncd.log
then 
     touch /var/log/lsyncd.log
fi
tail -f /var/log/lsyncd.log | while read line
do
   rout=$(grep '^/.*\.m' <<< $line)
   if [[ "$rout" != "" ]]
   then
        rout=${rout:1}
        echo "Compiling routine ${rout%%.*}" >> /home/project/log/rcomp.log
        ydb <<< "ZL \"${rout%%.*}\"" >> /home/project/log/rcomp.log 2>&1
   fi
   prog=$(grep '^/.*\.rs' <<< $line)
   if [[ "$prog" != "" ]]
   then
        prog=${prog##*/}
        echo "Compiling rust code ${prog%%.*}" >> /home/project/log/rcomp.log
        cd /usr/local/YDBRust && cargo run --example "${prog%%.*}" >> /home/project/log/rcomp.log 2>&1
   fi 
done

