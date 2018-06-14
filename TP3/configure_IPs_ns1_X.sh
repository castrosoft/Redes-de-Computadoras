ip netns exec ns1.1 ip -6 addr add 2001:aaaa:aaaa:1::1/64 dev fa1.0
ip netns exec ns1.1 ip -6 addr add 2001:aaaa:aaaa:2::1/64 dev fa1.1
ip netns exec ns1.1 ip -6 addr add 2001:aaaa:aaaa:3::1/64 dev fa1.2
ip netns exec ns1.1 ip -6 addr add 2001:aaaa:aaaa:7::1/64 dev fa1.3

ip netns exec ns1.2 ip -6 addr add 2001:aaaa:aaaa:1::2/64 dev fa2.0

ip netns exec ns1.3 ip -6 addr add 2001:aaaa:aaaa:2::2/64 dev fa3.0
ip netns exec ns1.3 ip -6 addr add 2001:aaaa:aaaa:4::1/64 dev fa3.1
ip netns exec ns1.3 ip -6 addr add 2001:aaaa:aaaa:5::1/64 dev fa3.2

ip netns exec ns1.4 ip -6 addr add 2001:aaaa:aaaa:3::2/64 dev fa4.0
ip netns exec ns1.4 ip -6 addr add 2001:aaaa:aaaa:4::2/64 dev fa4.1
ip netns exec ns1.4 ip -6 addr add 2001:aaaa:aaaa:6::1/64 dev fa4.2

ip netns exec ns1.5 ip -6 addr add 2001:aaaa:aaaa:5::2/64 dev eth5

ip netns exec ns1.6 ip -6 addr add 2001:aaaa:aaaa:6::2/64 dev eth6

ifconfig br-externo inet6 add 2001:aaaa:aaaa:7::2/64

#Agrego rutas estaticas

ip netns exec ns1.1 ip -6 route add 2001:aaaa:bbbb:1::/64 via 2001:aaaa:aaaa:7::3
ip netns exec ns1.1 ip -6 route add 2001:aaaa:bbbb:2::/64 via 2001:aaaa:aaaa:7::3
ip netns exec ns1.1 ip -6 route add 2001:aaaa:bbbb:3::/64 via 2001:aaaa:aaaa:7::3
ip netns exec ns1.1 ip -6 route add 2001:aaaa:aaaa:4::/64 via 2001:aaaa:aaaa:2::2
ip netns exec ns1.1 ip -6 route add 2001:aaaa:aaaa:5::/64 via 2001:aaaa:aaaa:2::2
ip netns exec ns1.1 ip -6 route add 2001:aaaa:aaaa:6::/64 via 2001:aaaa:aaaa:3::2
ip netns exec ns1.1 ip -6 route add default via 2001:aaaa:aaaa:7::3

ip netns exec ns1.2 ip -6 route add default via 2001:aaaa:aaaa:1::1
ip netns exec ns1.3 ip -6 route add default via 2001:aaaa:aaaa:2::1
ip netns exec ns1.4 ip -6 route add default via 2001:aaaa:aaaa:3::1
ip netns exec ns1.5 ip -6 route add default via 2001:aaaa:aaaa:5::1
ip netns exec ns1.6 ip -6 route add default via 2001:aaaa:aaaa:6::1










ip addr flush dev enp0s3
ifconfig enp0s3 down
ifconfig enp0s3 up
