#!/bin/bash
#mostrar todos los namespaces: ip netns list
#borrar todos los namespaces: ip -all netns delete

#crear namespaces
ip netns add ns2.1
ip netns add ns2.2
ip netns add ns2.3


#crear cables
ip link add 2.1 type veth peer name 2.2
ip link add l2.2 type veth peer name 2.3

#enchufar cables
ip link set 2.1 netns ns2.1
ip link set 2.2 netns ns2.2
ip link set l2.2 netns ns2.2
ip link set 2.3 netns ns2.3

#activar interfaces de loopback en cada ns
ip netns exec ns2.1 ip link set lo up
ip netns exec ns2.2 ip link set lo up
ip netns exec ns2.3 ip link set lo up

#activar interfaces con cables
ip netns exec ns2.1 ip link set 2.1 up
ip netns exec ns2.2 ip link set 2.2 up
ip netns exec ns2.2 ip link set l2.2 up
ip netns exec ns2.3 ip link set 2.3 up

#agregar direcciones IPv6
ip netns exec ns2.1 ip -6 address add 2001:1::1/64 dev 2.1
ip netns exec ns2.2 ip -6 address add 2001:1::2/64 dev 2.2
ip netns exec ns2.2 ip -6 address add 2001:2::1/64 dev l2.2
ip netns exec ns2.3 ip -6 address add 2001:2::10/64 dev 2.3

#convertir ns 2.1 y ns 2.2 en router
ip netns exec ns2.1 sysctl -w net.ipv6.conf.all.forwarding=1
ip netns exec ns2.2 sysctl -w net.ipv6.conf.all.forwarding=1

#ya puedo hacer ping del 2.2 al 2.1 y al 2.3
#agregar ruta estatica al ns2.1
ip netns exec ns2.1 ip -6 route add 2001:2::/64 via 2001:1::2
#agregar gw por defecto a ns3.1
ip netns exec ns2.3 ip -6 route add default via 2001:2::1
