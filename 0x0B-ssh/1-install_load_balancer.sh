#!/usr/bin/env bash
# set up load balancer
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:vbernat/haproxy-1.8
sudo apt-get -y update
sudo apt-get -y install haproxy

sudo sed -i -e '$aENABLED=1\n' /etc/default/haproxy
sudo sed -i -e '$a\listen http-in\n\tbind :80\n\tbalance roundrobin\n\tserver 29902-web-01 54.237.36.229:80 check\n\tserver 29902-web-02 54.175.224.138:80 check\n' /etc/haproxy/haproxy.cfg
sudo service haproxy restart
