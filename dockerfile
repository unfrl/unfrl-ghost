# Based on: https://github.com/colinmeinke/ghost-storage-adapter-s3/issues/100

FROM ghost:5.26.1-alpine AS ghost-base

RUN npm install --prefix /tmp/ghost-storage-adapter-s3 ghost-storage-adapter-s3 && \
    cp -r /tmp/ghost-storage-adapter-s3/node_modules/ghost-storage-adapter-s3 current/core/server/adapters/storage/s3 && \
    rm -r /tmp/ghost-storage-adapter-s3

RUN npm install ghost-storage-base && npm install aws-sdk

ENV storage__active s3
