docker-compose up -d

docker exec -it "$(docker ps | grep redis| grep master-1 | awk '{print $1}')" /bin/bash

redis-cli --cluster create 192.168.101.2:6379 192.168.101.2:6380 192.168.101.2:6381 192.168.101.2:6382 192.168.101.2:6383 192.168.101.2:6384 --cluster-replicas 1
