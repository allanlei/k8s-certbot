#!/bin/sh
set -e

FLAGS=""

if [ -z "$EMAIL" ]
    FLAGS="$FLAGS"
fi

# certbot -c /etc/letsencrypt/cli.ini certonly $EMAIL --agree-tos --standalone --manual-public-ip-logging-ok -d $DOMAINS
# envsubst < /etc/certbot/certbot.ini.tmp > /etc/certbot/certbot.ini

export STANDALONE_SUPPORTED_CHALLENGES=${STANDALONE_SUPPORTED_CHALLENGES:-http-01}

export domains=$(echo $DOMAINS | sed 's/, / /g' | sed 's/ /,/g')
envsubst < /etc/certbot/certbot.ini.tmp
# exec crond -f
