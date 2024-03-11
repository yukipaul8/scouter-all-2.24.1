#!/usr/bin/env bash

#nohup java -Xmx1024m -classpath ./scouter-server-boot.jar scouter.boot.Boot ./lib > nohup.out &
#sleep 1
#tail -100 nohup.out


config_file="/opt/SCOUTER/scouter/server/conf/scouter.conf"


###IF condition
if [ -f "$config_file" ]; then
 # current_ip=$(grep -E '^server_ip=' "$config_file" | cut -d '=' -f 2)
 current_ip=$(grep '^server_addr=' "$config_file" | awk -F'=' '{print $2}')

###error
else
  echo "Error: Configuration file '$config_file' not found."
  exit 1
fi


######################Dynamic mode declaration
# Extract the value of net_udp_listen_port
udp_port=$(grep '^net_udp_listen_port=' "$config_file" | awk -F'=' '{print $2}')

# Extract the value of net_tcp_listen_port
tcp_port=$(grep '^net_tcp_listen_port=' "$config_file" | awk -F'=' '{print $2}')



# Print the startup message with IP, UDP, and TCP ports
echo "INFO [Scouter] Scouter Server started. IP: $current_ip, UDP Port: $udp_port, TCP Port: $tcp_port"

nohup java -Xmx1024m -classpath ./scouter-server-boot.jar scouter.boot.Boot ./lib -Dserver_addr=$current_ip -Dserver_udp_port=$udp_port -Dserver_tcp_port=$tcp_port> nohup.out 2>&1 &
sleep 1
tail -100 nohup.out





