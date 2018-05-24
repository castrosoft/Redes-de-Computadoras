#!/bin/bash

#Hosts
echo "Borrando default e instalando traceroute"
echo "[Host 11]"
docker exec -it ospf_h11_1 ip -6 route del default
#docker exec -it ospf_h11_1 apt-get install traceroute
echo "[Host 12]"
docker exec -it ospf_h12_1 ip -6 route del default
#docker exec -it ospf_h12_1 apt-get install traceroute
echo "[Host 13]"
docker exec -it ospf_h13_1 ip -6 route del default
#docker exec -it ospf_h13_1 apt-get install traceroute
echo "[Host 14]"
docker exec -it ospf_h14_1 ip -6 route del default
#docker exec -it ospf_h14_1 apt-get install traceroute

#Routers
echo "[Router 1]"
docker exec -it ospf_r1_1 ip -6 route del default
#docker exec -it ospf_r1_1 apt-get install traceroute
echo "[Router 2]"
docker exec -it ospf_r2_1 ip -6 route del default
#docker exec -it ospf_r1_1 apt-get install traceroute
echo "[Router 3]"
docker exec -it ospf_r3_1 ip -6 route del default
#docker exec -it ospf_r3_1 apt-get install traceroute
echo "[Router 4]"
docker exec -it ospf_r4_1 ip -6 route del default
#docker exec -it ospf_r4_1 apt-get install traceroute
echo "[Router 5]"
docker exec -it ospf_r5_1 ip -6 route del default
#docker exec -it ospf_r5_1 apt-get install traceroute
echo "[Router 6]"
docker exec -it ospf_r6_1 ip -6 route del default
#docker exec -it ospf_r6_1 apt-get install traceroute
echo "[Router 7]"
docker exec -it ospf_r7_1 ip -6 route del default
#docker exec -it ospf_r7_1 apt-get install traceroute
echo "[Router 8]"
docker exec -it ospf_r8_1 ip -6 route del default
#docker exec -it ospf_r8_1 apt-get install traceroute


# Default gateways
echo "Estableciendo default gateways para los hosts"
docker exec -it ospf_h11_1 ip -6 route add default via 2001:aaaa:aaaa:3::2
docker exec -it ospf_h12_1 ip -6 route add default via 2001:aaaa:aaaa:4::2
docker exec -it ospf_h13_1 ip -6 route add default via 2001:aaaa:aaaa:b::2
docker exec -it ospf_h14_1 ip -6 route add default via 2001:aaaa:aaaa:c::2

echo "HECHO!"
