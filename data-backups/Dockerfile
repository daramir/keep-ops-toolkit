FROM debian:buster-slim

# make sure we have cron
RUN apt-get update && apt-get install -y cron curl unzip vim
# install rclone
RUN curl https://rclone.org/install.sh | bash

WORKDIR /app
ADD ./docker-cron.sh ./dailybackup.sh ./datasync.sh  ./bin/
RUN mkdir logs

# prepare cron permissions
RUN chgrp crontab /usr/bin/crontab
RUN chmod g+s /usr/bin/crontab
RUN touch /var/spool/cron/crontabs/appuser
RUN echo "appuser"  > /etc/cron.allow
RUN chmod gu+s /usr/sbin/cron \
    && /usr/sbin/service cron start
RUN chmod gu+rw /var/run \
    && chmod 4774 -R /var/spool/cron \
    && chmod 764 /var/run/crond.pid

# Switching to a non-root user
RUN useradd appuser -m -u 1001 && chown -R appuser /app \
    && usermod -a -G crontab appuser && usermod -a -G root appuser
RUN chown appuser /var/spool/cron/crontabs/appuser
RUN chmod 600 /var/spool/cron/crontabs/*

USER appuser

# During debugging, this entry point will be overridden.
# CMD ["sh", "/app/bin/docker-cron.sh"]
