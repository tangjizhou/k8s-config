docker-compose down
rm -rf redis
docker-compose up -d
container=$(docker ps | grep redis| grep master-1 | awk '{print $1}')
ip=$(ifconfig | grep 192 | awk '{print $2}' | grep 192)
docker exec -it $container redis-cli --cluster create "$ip:6379" "$ip:6380" "$ip:6381" "$ip:6382" "$ip:6383" "$ip:6384" --cluster-replicas 1 --cluster-yes