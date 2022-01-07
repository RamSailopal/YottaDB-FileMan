#!/bin/bash
chpasswd <<< "root:getmein"
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "source $(pkg-config --variable=prefix yottadb)/ydb_env_set" >> /root/.bashrc
service ssh start
/usr/local/bin/filemaninst.sh
service ssh restart
/bin/bash -c '/usr/local/bin/rcopy.sh'
