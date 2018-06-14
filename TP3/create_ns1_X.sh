echo Eliminando componentes anteriores
ip -all netns del
ip link set dev br-externo down
brctl delbr br-externo

echo Creando namespaces:
for i in $(seq 1 6); do
  ip netns add ns1.$i
  ip netns exec ns1.$i ip link set dev lo up
  ip netns exec ns1.$i sysctl -w net.ipv6.conf.all.forwarding=1
  echo ns1.$i
done

echo Creando y conectando todas las interfaces virtuales
#Creo interfaces para unir ns1.1 con ns1.2
ip link add fa1.0 type veth peer name fa2.0

#Conecto interfaz a ns1.1
ip link set fa1.0 netns ns1.1
ip netns exec ns1.1 ip link set dev fa1.0 up

#Conecto interfaz a ns1.2
ip link set fa2.0 netns ns1.2
ip netns exec ns1.2 ip link set dev fa2.0 up
#############################################################

#Creo interfaces para unir ns1.1 con ns1.3
ip link add fa1.1 type veth peer name fa3.0

#Conecto interfaz a ns1.1
ip link set fa1.1 netns ns1.1
ip netns exec ns1.1 ip link set dev fa1.1 up

#Conecto interfaz a ns1.3
ip link set fa3.0 netns ns1.3
ip netns exec ns1.3 ip link set dev fa3.0 up
#############################################################

#Creo interfaces para unir ns1.1 con ns1.4
ip link add fa1.2 type veth peer name fa4.0

#Conecto interfaz a ns1.1
ip link set fa1.2 netns ns1.1
ip netns exec ns1.1 ip link set dev fa1.2 up

#Conecto interfaz a ns1.4
ip link set fa4.0 netns ns1.4
ip netns exec ns1.4 ip link set dev fa4.0 up
############################################################

#Creo interfaces para unir ns1.3 con ns1.4
ip link add fa3.1 type veth peer name fa4.1

#Conecto interfaz a ns1.3
ip link set fa3.1 netns ns1.3
ip netns exec ns1.3 ip link set dev fa3.1 up

#Conecto interfaz a ns1.4
ip link set fa4.1 netns ns1.4
ip netns exec ns1.4 ip link set dev fa4.1 up
############################################################

#Creo interfaces para unir ns1.3 con ns1.5
ip link add fa3.2 type veth peer name eth5

#Conecto interfaz a ns1.3
ip link set fa3.2 netns ns1.3
ip netns exec ns1.3 ip link set dev fa3.2 up

#Conecto interfaz a ns1.5
ip link set eth5 netns ns1.5
ip netns exec ns1.5 ip link set dev eth5 up
############################################################

#Creo interfaces para unir ns1.4 con ns1.6
ip link add fa4.2 type veth peer name eth6

#Conecto interfaz a ns1.4
ip link set fa4.2 netns ns1.4
ip netns exec ns1.4 ip link set dev fa4.2 up

#Conecto interfaz a ns1.6
ip link set eth6 netns ns1.6
ip netns exec ns1.6 ip link set dev eth6 up
############################################################

#Creo interfaces para unir ns1.1 con bridge
ip link add fa1.3 type veth peer name brside

#Conecto interfaz a ns1.1
ip link set fa1.3 netns ns1.1
ip netns exec ns1.1 ip link set dev fa1.3 up

echo Creando bridge externo
brctl addbr br-externo
brctl stp br-externo off
ip link set dev br-externo up
brctl addif br-externo brside
brctl addif br-externo enp0s3
ip link set dev brside up

#Configuro MTU para todas las interfaces
echo Configurando MTU a 1500 en todas las interfaces
sudo ip netns exec ns1.1 ifconfig fa1.0 mtu 1500
sudo ip netns exec ns1.1 ifconfig fa1.1 mtu 1500
sudo ip netns exec ns1.1 ifconfig fa1.2 mtu 1500
sudo ip netns exec ns1.1 ifconfig fa1.3 mtu 1300

sudo ip netns exec ns1.2 ifconfig fa2.0 mtu 1500
sudo ip netns exec ns1.2 ifconfig lo mtu 1500

sudo ip netns exec ns1.3 ifconfig fa3.0 mtu 1500
sudo ip netns exec ns1.3 ifconfig fa3.1 mtu 1500
sudo ip netns exec ns1.3 ifconfig fa3.2 mtu 1500

sudo ip netns exec ns1.4 ifconfig fa4.0 mtu 1500
sudo ip netns exec ns1.4 ifconfig fa4.1 mtu 1500
sudo ip netns exec ns1.4 ifconfig fa4.2 mtu 1500

sudo ip netns exec ns1.5 ifconfig eth5 mtu 1500

sudo ip netns exec ns1.6 ifconfig eth6 mtu 1500

ifconfig brside mtu 1500
ifconfig enp0s3 mtu 1500
