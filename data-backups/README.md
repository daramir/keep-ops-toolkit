# Data Backups of Keep Nodes

Backup Random Beacon and ECDSA node files. Inspired by this article https://www.notion.so/KEEP-BACKUPS-42a73ee62fb74c8193669c00b739265f

## TL;DR Getting started

1. Create a copy of `rclone.SAMPLE.conf` to `rclone.conf` and fill in with the values that correspond to your remote type. I use AWS S3, so I kept the first config section in the SAMPLE file, and filled in the `access_key_id` and `secret_access_key` attributes with the right values.

2. Create a copy of `init-vars.SAMPLE.sh` to `init-vars.sh` and fill in with the variables with your remote name as per `rclone.conf` and etc.

3. By now you you should be done with files that will be mounted into the container's volumes. If you want to ange the location of these files edit `docker-compose.yaml`
```yaml 
  volumes:
      - ./init-vars.sh:/app/cfg/init-vars.sh
      - ./rclone.conf:/home/appuser/.config/rclone/rclone.conf
```
4. Last config steps would be in `docker-compose.yaml`. Adjust log driver to suit your current setup. Also, make sure you load up your main folder or individual data folders here. In my case this is as simple as making the change below in line 29.
```diff
-      - ./sample-data:/home/appuser/keep-backups:ro
+      - /home/ubuntu/keep-ecdsa:/home/appuser/keep-backups:ro
```
5. All done! Now just run `docker-compose up` and watch that valuable data go to a safe location on schedule

### docker-cron.sh
Based on https://github.com/senorihl/docker-compose-cronjob/blob/master/crontab.sh.