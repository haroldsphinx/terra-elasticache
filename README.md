# terra-elasticache
a distributed Elasticache cluster created with terraform with automatic backup and restore implemented

Tasks
* Create Manual Backup of Redis Cluster as Failover
* Setup Automatic Backup with Scheduling and Retention configurations
* Create a New Redis Cluster from the Backup
* Automate the backup and restore process with Terraform
 
# Getting Started

* Install and Setup terraform with AWS Credentials 
* Run `terraform plan` and `terraform apply` in your terminal to create a distributed elasticache cluster with automatic backup enabled
* To run manual backup from terraform, edit the `ssh.tf` file, go to the `aws instance ssh_host` resource and change the userdata file to `backup.sh.tpl`
* To run manual restore from terraform, edit the `ssh.tf` file, go to the `aws instance ssh_host` resource and change the userdata file to `restore.sh.tpl` (Please modify the restore.sh.tpl file with the appropiate paramters before proceeding)
