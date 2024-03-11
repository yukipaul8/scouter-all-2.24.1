#!/usr/bin/env bash

#nohup java  -classpath ./scouter.host.jar scouter.boot.Boot ./lib > nohup.out &
#sleep 1
#tail -100 nohup.out




#config_file="/opt/SCOUTER/scouter/webapp/conf/scouter.conf"


###IF condition
#if [ -f "$config_file" ]; then
 # current_ip=$(grep -E '^server_ip=' "$config_file" | cut -d '=' -f 2)
# current_ip=$(grep '^net_collector_ip=' "$config_file" | awk -F'=' '{print $2}')

###error
#else
#  echo "Error: Configuration file '$config_file' not found."
#  exit 1
#fi
######################Dynamic mode declaration
# Extract the value of net_udp_listen_port
#udp_port=$(grep '^net_collector_udp_port=' "$config_file" | awk -F'=' '{print $2}')

# Extract the value of net_tcp_listen_port
#tcp_port=$(grep '^net_collector_tcp_port=' "$config_file" | awk -F'=' '{print $2}')

# Print the startup message with IP, UDP, and TCP ports
#echo "INFO [Scouter] Scouter Host started. IP: $current_ip, UDP Port: $udp_port, TCP Port: $tcp_port"


#nohup java -Xmx1024m -classpath ./scouter.webapp.jar scouter.boot.Boot ./lib -Dserver_addr=$current_ip -Dserver_udp_port=$udp_port -Dserver_tcp_port=$tcp_port > nohup.out 2>&1 &




#!/bin/bash

# Path to the configuration file
conf_file="/opt/SCOUTER/scouter/webapp/conf/scouter.conf"

# Extract the values from the configuration file
net_http_api_swagger_enabled=$(grep '^net_http_api_swagger_enabled=' "$conf_file" | awk -F'=' '{print $2}')
net_collector_ip_port_id_pws=$(grep '^net_collector_ip_port_id_pws=' "$conf_file" | awk -F'=' '{print $2}')
net_http_port=$(grep '^net_http_port=' "$conf_file" | awk -F'=' '{print $2}')
net_http_api_auth_bearer_token_enabled=$(grep '^net_http_api_auth_bearer_token_enabled=' "$conf_file" | awk -F'=' '{print $2}')
net_http_api_auth_ip_enabled=$(grep '^net_http_api_auth_ip_enabled=' "$conf_file" | awk -F'=' '{print $2}')
net_http_api_auth_session_enabled=$(grep '^net_http_api_auth_session_enabled=' "$conf_file" | awk -F'=' '{print $2}')
net_http_api_auth_bearer_token_enabled=$(grep '^net_http_api_auth_bearer_token_enabled=' "$conf_file" | awk -F'=' '{print $2}')
net_http_api_cors_allow_origin=$(grep '^net_http_api_cors_allow_origin=' "$conf_file" | awk -F'=' '{print $2}')
net_http_api_cors_allow_credentials=$(grep '^net_http_api_cors_allow_credentials=' "$conf_file" | awk -F'=' '{print $2}')

# Other settings for the web application
webapp_settings="-Dnet_http_api_swagger_enabled=$net_http_api_swagger_enabled"
webapp_settings+=" -Dnet_collector_ip_port_id_pws=$net_collector_ip_port_id_pws"
webapp_settings+=" -Dnet_http_port=$net_http_port"
webapp_settings+=" -Dnet_http_api_auth_bearer_token_enabled=$net_http_api_auth_bearer_token_enabled"
webapp_settings+=" -Dnet_http_api_auth_ip_enabled=$net_http_api_auth_ip_enabled"
webapp_settings+=" -Dnet_http_api_auth_session_enabled=$net_http_api_auth_session_enabled"
webapp_settings+=" -Dnet_http_api_auth_bearer_token_enabled=$net_http_api_auth_bearer_token_enabled"
webapp_settings+=" -Dnet_http_api_cors_allow_origin=$net_http_api_cors_allow_origin"
webapp_settings+=" -Dnet_http_api_cors_allow_credentials=$net_http_api_cors_allow_credentials"



# Print the extracted values
echo "net_http_api_swagger_enabled: $net_http_api_swagger_enabled"
echo "net_collector_ip_port_id_pws: $net_collector_ip_port_id_pws"
echo "net_http_port: $net_http_port"
echo "net_http_api_auth_bearer_token_enabled: $net_http_api_auth_bearer_token_enabled"
echo "net_http_api_auth_ip_enabled: $net_http_api_auth_ip_enabled"
echo "net_http_api_auth_session_enabled: $net_http_api_auth_session_enabled"
echo "net_http_api_auth_bearer_token_enabled: $net_http_api_auth_bearer_token_enabled"
echo "net_http_api_cors_allow_origin: $net_http_api_cors_allow_origin"
echo "net_http_api_cors_allow_credentials: $net_http_api_cors_allow_credentials"


# Path to the webapp jar file
webapp_jar="./scouter.webapp.jar"

# Start the web application
#nohup java -Xmx1024m -classpath "$webapp_jar" scouter.boot.Boot ./lib $webapp_settings > nohup.out 2>&1 &


#nohup java -Xmx1024m -classpath ./scouter.webapp.jar scouter.boot.Boot ./lib $webapp_settings > nohup.out 2>&1 &

# Start the web application
echo "Starting the web application..."
nohup java -cp "./scouter.webapp.jar:./lib/*:." scouterx.webapp.main.WebAppMain $webapp_settings > nohup.out 2>&1 &

# Print a message indicating the startup
echo "Web application started. Check 'nohup.out' for logs."




sleep 1
tail -100 nohup.out
