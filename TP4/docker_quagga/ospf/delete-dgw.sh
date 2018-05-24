for i in $(seq 1 8); do
  echo Borrando DWG en Router $i
  sudo docker exec -it ospf_r$i"_1" /bin/sh -c  "ip -6 route del default"  
done
