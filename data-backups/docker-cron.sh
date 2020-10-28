#!/usr/bin/env bash

whoami
# Ensure the log file exists
touch /app/logs/rclone-crontab.log

# Ensure permission on the command
#chmod a+x /app/bin/my-awesome-command
chmod a+x /app/bin/dailybackup.sh
chmod a+x /app/bin/datasync.sh


# Added a cronjob in a new crontab
# echo "* * * * * /usr/local/bin/node /app/bin/my-awesome-command >> /app/logs/rclone-crontab.log 2>&1" > /etc/crontab
echo "0 4 * * * /app/bin/dailybackup.sh >> /app/logs/rclone-crontab.log 2>&1" >> /var/spool/cron/crontabs/appuser
echo "*/5 * * * * /app/bin/datasync.sh >> /app/logs/rclone-crontab.log 2>&1" >> /var/spool/cron/crontabs/appuser

# Registering the new crontab
crontab /var/spool/cron/crontabs/appuser

# Starting the cron
/usr/sbin/service cron start

# Displaying logs
# Useful when executing `docker logs -f`
trap 'exit 143' INT TERM # exit = 128 + 15 (SIGTERM)
tail -f /app/logs/rclone-crontab.log & ; wait
