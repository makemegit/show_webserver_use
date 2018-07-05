w | head -n1
echo "---"
echo "Connections ont port 80:"
netstat -anp |grep 80 |wc -l
echo "Connections ont port 443:"
netstat -anp |grep 443 |wc -l
echo "---"
echo "Most hits from ApacheStatus:"
lynx -dump -width 500 http://127.0.0.1/whm-server-status | awk '{print $11}' | sort | uniq -c | sort -n | tail -n10
echo "---"
echo "Mysql use:"
mysqladmin processlist
echo "DISK IOwait"
iotop -qbon1 | grep -vi "total\|actual\|command" | awk '{print $10" "$11" "$12}'
