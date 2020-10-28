# Note: paths as attached to the container! Check docker-compose.yml
export DATA_FOLDER_PATH='/home/appuser/keep-backups/'

# 'random-beacon', 'ecdsa', 'my-creative-name' ... your pick
export NODE_TYPE='random-beacon'

# REMOTE_NAME doesn't include actual bucket name and should match the rclone.conf remote name
export REMOTE_NAME='s3-keep-1-ropsten'

export OPERATOR_ADDRESS='0x1'

export BUCKET_NAME="s3-bucket-keep-ropsten"
export BUCKET_PATH="${OPERATOR_ADDRESS}/$NODE_TYPE"