sudo docker rm -f ospf_r1_1 ospf_r2_1 ospf_r3_1 ospf_r4_1 ospf_r5_1 ospf_r6_1 ospf_r7_1 ospf_r8_1 ospf_h11_1 ospf_h12_1 ospf_h13_1 ospf_h14_1
echo All containers deleted.
sudo docker network prune
echo All networks deleted.
