# Data Backups of Keep Nodes

## TL;DR Getting started

1. Create a copy of `rclone.SAMPLE.conf` to `rclone.conf` and fill in with the values that correspond to your remote type. I use AWS S3, so I kept the first config section in the SAMPLE file, and filled in the `access_key_id` and `secret_access_key` attributes with the right values.

2. Create a copy of `init-vars.SAMPLE.sh` to `init-vars.sh` and fill in with the variables with your remote name as per `rclone.conf` and etc.

3. You should be done with 
  volumes:
      - ./init-vars.sh:/app/cfg/init-vars.sh
      - ./rclone.conf:/home/appuser/.config/rclone/rclone.conf

4. Last config step

      # Load up your main folder or individual folders here, examples below
      # - /home/ubuntu/keep-ecdsa:/home/appuser/keep-backups
      # - /mnt/secure-volume/persistence:/home/appuser/keep-backups/persistence
      - /home/ubuntu/keep-client/:/home/appuser/keep-backups



### docker-cron.sh
Attributions go to 
https://github.com/senorihl/docker-compose-cronjob/blob/master/crontab.sh