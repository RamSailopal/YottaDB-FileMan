#!/bin/bash
(echo "D ^%RI";echo "N";echo "/tmp/VA-FILEMAN-22P2.RSA";echo "/data/r1.32_x86_64/r") | /opt/yottadb/current/ydb
cp /data/r1.32_x86_64/r/DIDT.m /data/r1.32_x86_64/r/_DT.m
cp /data/r1.32_x86_64/r/DIDTC.m /data/r1.32_x86_64/r/_DTC.m
cp /data/r1.32_x86_64/r/DIRCR.m /data/r1.32_x86_64/r/_RCR.m
cp /data/r1.32_x86_64/r/DIIS.m /data/r1.32_x86_64/r/_ZIS.m
cp /data/r1.32_x86_64/r/DIISS.m /data/r1.32_x86_64/r/_ZISS.m
cp /data/r1.32_x86_64/r/DISSC.m /data/r1.32_x86_64/r/_ZISC.m
(echo "D ^DINIT";echo "Y";echo "TEST";echo "999";echo "Y";echo "GT.M(UNIX)") | /opt/yottadb/current/ydb

