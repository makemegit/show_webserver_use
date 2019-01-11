hostname
w | head -n1
echo "---"
top -b -d1 -n1| grep -i "Cpu(s)" | awk '{print "CPU:" $2 "%"}' | head -n1
free -h | grep -i mem | awk '{print "Free Ram: "$7}'
echo "---"
echo "Connections on port 80:"
netstat -anp |grep 80 |wc -l
echo "Connections on port 443:"
netstat -anp |grep 443 |wc -l
echo "---"
echo "Most IP hits from ApacheStatus:"
curl -iks -u user:pass https://localhost:7080/status?rpt=details |awk '{print $1}' | sort | uniq -c | sort -n | tail -n10
echo "Most WebSite hits from ApacheStatus:"
curl -iks -u user:pass https://localhost:7080/status?rpt=details |awk '{print $9}' | sort | uniq -c | sort -n | tail -n10
echo "---"
echo "Mysql use:"
mysqladmin processlist
echo "DISK IOwait"
iotop -qbon1 | grep -vi "total\|actual\|command" | awk '{print $10" "$11" "$12}'
