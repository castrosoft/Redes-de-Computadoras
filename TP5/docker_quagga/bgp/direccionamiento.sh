#!/bin/bash

#Hosts
echo "Borrando defaults gateway"
echo "[Host 11]"
docker exec -it bgp_h11_1 ip -6 route del default
#docker exec -it ospf_h11_1 apt-get install traceroute
echo "[Host 12]"
docker exec -it bgp_h12_1 ip -6 route del default
#docker exec -it ospf_h12_1 apt-get install traceroute
echo "[Host 13]"
docker exec -it bgp_h13_1 ip -6 route del default
#docker exec -it ospf_h13_1 apt-get install traceroute
echo "[Host 14]"
docker exec -it bgp_h14_1 ip -6 route del default
#docker exec -it ospf_h14_1 apt-get install traceroute
#Routers de Borde
echo "[Router b1]"
docker exec -it bgp_b1_1 ip -6 route del default
#docker exec -it ospf_r1_1 apt-get install traceroute
echo "[Router b2]"
docker exec -it bgp_b2_1 ip -6 route del default
#docker exec -it ospf_r1_1 apt-get install traceroute
echo "[Router b3]"
docker exec -it bgp_b3_1 ip -6 route del default
#docker exec -it ospf_r3_1 apt-get install traceroute
#Routers OSPF
echo "[Router 1]"
docker exec -it bgp_r1_1 ip -6 route del default
#docker exec -it ospf_r1_1 apt-get install traceroute
echo "[Router 2]"
docker exec -it bgp_r2_1 ip -6 route del default
#docker exec -it ospf_r1_1 apt-get install traceroute
echo "[Router 3]"
docker exec -it bgp_r3_1 ip -6 route del default
#docker exec -it ospf_r3_1 apt-get install traceroute
echo "[Router 4]"
docker exec -it bgp_r4_1 ip -6 route del default
#docker exec -it ospf_r4_1 apt-get install traceroute
echo "[Router 5]"
docker exec -it bgp_r5_1 ip -6 route del default
#docker exec -it ospf_r5_1 apt-get install traceroute
echo "[Router 6]"
docker exec -it bgp_r6_1 ip -6 route del default
#docker exec -it ospf_r6_1 apt-get install traceroute
echo "[Router 7]"
docker exec -it bgp_r7_1 ip -6 route del default
#docker exec -it ospf_r7_1 apt-get install traceroute



# Default gateways
echo "Estableciendo default gateways para los hosts"
docker exec -it bgp_h11_1 ip -6 route add default via 2001:aaaa:1111::10
docker exec -it bgp_h12_1 ip -6 route add default via 2001:bbbb:2222::10
docker exec -it bgp_h13_1 ip -6 route add default via 2001:dddd:aaaa::15
docker exec -it bgp_h14_1 ip -6 route add default via 2001:eeee:bbbb::15

echo "HECHO!"
