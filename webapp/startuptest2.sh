#!/usr/bin/env bash
#export JDK_JAVA_OPTIONS="--add-modules java.xml.bind"
#nohup java -cp ./scouter.webapp.jar:./lib/*:.  scouterx.webapp.main.WebAppMain > nohup.out &
#sleep 1
#tail -100 nohup.out

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
net_http_api_allow_ips=$(grep '^net_http_api_allow_ips=' "$conf_file" | awk -F'=' '{print $2}')

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
webapp_settings+=" -Dnet_http_api_allow_ips=$net_http_api_allow_ips"

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
echo "net_http_api_allow_ips: $net_http_api_allow_ips"

# Path to the webapp jar file
webapp_jar="./scouter.webapp.jar"

# Start the web application
echo "Starting the web application..."



nohup java -cp "./scouter.webapp.jar:./lib/*:." scouterx.webapp.main.WebAppMain $webapp_settings > nohup.out 2>&1 &

#nohup java -cp "./scouter.webapp-2.20.0.jar:./lib/*:." scouterx.webapp.main.WebAppMain $webapp_settings > nohup.out 2>&1 &


# Print a message indicating the startup
echo "Web application started. Check 'nohup.out' for logs."

sleep 1
tail -100 nohup.out




