FROM        alpine:3.4
# MAINTAINER

COPY        entrypoint.sh /entrypoint.sh
COPY        certbot.ini.tmp /etc/certbot/certbot.ini.tmp
RUN         apk --no-cache add \
                gettext \
                certbot && \
            apk --no-cache --repository https://dl-3.alpinelinux.org/alpine/edge/testing add \
                incron && \
            chmod +x /entrypoint.sh && \
            mkdir -p /etc/certbot && \
            echo "certbot certonly -c /etc/certbot/certbot.ini" > /etc/periodic/daily/certbot && \
            chmod 0644 /etc/periodic/daily/certbot

EXPOSE      80/tcp 443/tcp
ENTRYPOINT  ["/entrypoint.sh"]
CMD         ["crond", "-f"]
