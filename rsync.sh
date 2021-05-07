#!/bin/bash

USER=/home/mufty/TMP/mufty
#check if internet connect is available
if ping -q -c 1 -W 1 8.8.8.8 >/dev/null;then
    #vpn is off
    # nmcli con up id ETH # turn on vpn connection
    echo "VPN is active"
  echo "upload started"
  # internet available 
  # start upload to remote server
  # rsync -aP --exclude="*.active" $USER muomar@hispalensis:/srv/beegfs02/scratch/aegis_guardian/data/amalitech_rosbags/tmp/turtlesimBags
  # rsync -aP --exclude="*.active" $USER 3.251.25.174/aegis
  # rsync -a ~/user1 ssh -i "aegis-rider-stg.pem" ubuntu@ec2-3-251-25-174.eu-west-1.compute.amazonaws.com
  rsync -av — progress -e "ssh -i aegis-rider-stg.pem" /home/mufty/bagfiles ubuntu@ec2-3-251-25-174.eu-west-1.compute.amazonaws.com:/home/ubuntu/aegis

  # rsync -av — progress -e “ssh -i /path_to/your_public_key.pem/” /absolute_path_to/local_files/ remote_server_root@public_DNS:/absolut_path/remote_directory_destination  
else
  echo "IPv4 is down"
fi