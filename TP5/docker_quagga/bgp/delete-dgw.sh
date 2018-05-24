for i in $(seq 1 7); do
  echo Borrando DWG en Router $i
  sudo docker exec -it bgp_r$i"_1" /bin/sh -c  "ip -6 route del default"  
done
for i in $(seq 1 3); do
  echo Borrando DWG en Router de borde $i
  sudo docker exec -it bgp_b$i"_1" /bin/sh -c  "ip -6 route del default"  
done
for i in $(seq 1 4); do
  echo Borrando DWG en Host $i
  sudo docker exec -it bgp_h1$i"_1" /bin/sh -c  "ip -6 route del default"  
done

