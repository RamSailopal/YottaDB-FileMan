#!/bin/bash
if test -d /home/project
then 
   if ! test -d /home/project/Yottadb
   then
     mkdir /home/project/Yottadb
     cp -Rf /data/r1.32_x86_64/o /home/project/Yottadb
     cp -Rf /data/r1.32_x86_64/r /home/project/Yottadb
     cp -Rf /usr/local/YDBRust/examples /home/project/Yottadb
     cp -Rf /usr/local/YDBRust/src /home/project/Yottadb
     cp -f /usr/local/YDBRust/Cargo.toml /home/project/Yottadb
     chmod -R o+w /home/project/*
     mkdir /home/project/log
   else
     rm -f /home/project/log/rcomp.log
   fi
   lsyncd -logfile /var/log/lsyncd.log /etc/lsyncd.conf
   echo "Theia IDE is now ready to use"
   echo "Starting compilation process" >> /home/project/log/rcomp.log
   /usr/local/bin/rcomp.sh
else
   tail -f /dev/null
fi
