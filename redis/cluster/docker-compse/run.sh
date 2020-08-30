#!/usr/bin/env bash
# 创建单节点
docker-compose up -d
# 连接集群
docker exec -it master-1 redis-cli --cluster create 192.168.2.102:6379 \
192.168.2.102:6380 \
192.168.2.102:6381 \
192.168.2.102:6382 \
192.168.2.102:6383 \
192.168.2.102:6384 --cluster-replicas 1