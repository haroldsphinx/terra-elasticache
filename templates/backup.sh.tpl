#!/bin/bash
# Manual Backup with Cluster Mode Enabled
aws elasticache create-snapshot --replication-group-id myClusteredRedis --snapshot-name bkup-20150515