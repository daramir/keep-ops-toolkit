#!/bin/sh

# Load variables for bucket path, authentication if applicable, etc.
# Create init-vars.sh following init-vars.SAMPLE.sh
. /app/cfg/init-vars.sh

echo "dailybackup-START: Starting backup of $OPERATOR_ADDRESS:$NODE_TYPE at $DATA_FOLDER_PATH"
#Daily Backups
rclone copy $DATA_FOLDER_PATH/persistence $REMOTE_NAME:$BUCKET_NAME/$BUCKET_PATH/daily/current \
 --backup-dir $REMOTE_NAME:$BUCKET_NAME/$BUCKET_PATH/daily/`date -I`
echo "dailybackup-END: $(date) backed up."