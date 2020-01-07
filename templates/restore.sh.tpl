#!/bin/bash
# Restoring from a backup with Cluster Mode Enabled

aws elasticache create-replication-group --replication-group-id myRedis \
--replication-group-description "desc of myRedis" \
--automatic-failover-enabled --num-cache-clusters 3 \
--cache-node-type cache.m3.medium \
--engine redis --engine-version 2.8.24 \
--cache-parameter-group-name default.redis2.8 \
--cache-subnet-group-name default --security-group-ids sg-12345678