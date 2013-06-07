#/bin/bash
tm=" "
tm= ` date +%F%I%M%S`
sh /opt/glu/4.6.2/bin/agentctl.sh stop
echo $tm
mkdir -p /opt/glu/glu_logs
mv /opt/glu/data/logs /opt/glu/glu_logs/logs.`date +%F%I%M%S`
rm -rf /opt/glu/data
kill -n 9 $(ps -elf|grep glu|grep -v grep|grep -v tail|awk '{print $4}')
/bin/sleep 1
sh /opt/glu/4.6.2/bin/agentctl.sh start
sh /opt/glu/4.6.2/bin/agentctl.sh status
~

