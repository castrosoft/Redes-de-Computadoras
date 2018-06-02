#!/bin/bash
echo Borrando defaults gateway...
docker exec -it bgp_b1_1 ip -6 r del default
docker exec -it bgp_b2_1 ip -6 r del default
docker exec -it bgp_b3_1 ip -6 r del default
docker exec -it bgp_r3_1 ip -6 r del default
docker exec -it bgp_r4_1 ip -6 r del default
docker exec -it bgp_r5_1 ip -6 r del default
docker exec -it bgp_r6_1 ip -6 r del default
docker exec -it bgp_r7_1 ip -6 r del default
docker exec -it bgp_r8_1 ip -6 r del default
docker exec -it bgp_r9_1 ip -6 r del default
docker exec -it bgp_h11_1 ip -6 r del default
docker exec -it bgp_h12_1 ip -6 r del default
docker exec -it bgp_h13_1 ip -6 r del default
docker exec -it bgp_h14_1 ip -6 r del default
echo Asignando defaults gateway...
docker exec -it bgp_r3_1 ip -6 r add default via 2001:a:2::10
docker exec -it bgp_r4_1 ip -6 r add default via 2001:a:12::10
docker exec -it bgp_r5_1 ip -6 r add default via 2001:a:3::10
docker exec -it bgp_r6_1 ip -6 r add default via 2001:a:13::10
docker exec -it bgp_r7_1 ip -6 r add default via 2001:a:4::10
docker exec -it bgp_r8_1 ip -6 r add default via 2001:a:14::10
docker exec -it bgp_r9_1 ip -6 r add default via 2001:a:9::10
docker exec -it bgp_h11_1 ip -6 r add default via 2001:a:5::10
docker exec -it bgp_h12_1 ip -6 r add default via 2001:a:15::10
docker exec -it bgp_h13_1 ip -6 r add default via 2001:a:6::10
docker exec -it bgp_h14_1 ip -6 r add default via 2001:a:16::10
echo HECHO!

