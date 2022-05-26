#!/bin/sh
sysctl -w vm.max_map_count=524298
echo "vm.max_map_count = 524298" >> /etc/sysctl.conf
