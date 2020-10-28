#!/bin/sh

# Load variables for bucket path, authentication if applicable, etc.
# Create init-vars.sh following init-vars.SAMPLE.sh
. /app/cfg/init-vars.sh

echo "datasync-START: Starting sync of $OPERATOR_ADDRESS:$NODE_TYPE at $DATA_FOLDER_PATH"
rclone sync $DATA_FOLDER_PATH $REMOTE_NAME:$BUCKET_NAME/$BUCKET_PATH/sync \
 --exclude "keystore/**" \
 --local-no-check-updated
# some would like to exclude these as well, up to you 
# --exclude 'trace.json' --exclude '.*{/**,}'  

echo "datasync-END: $OPERATOR_ADDRESS:$NODE_TYPE data synced"
