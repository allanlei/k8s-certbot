FROM        alpine:3.4
# MAINTAINER

COPY        entrypoint.sh /entrypoint.sh
COPY        certbot.ini.tmp /etc/certbot/certbot.ini.tmp
RUN
            apk --no-cache --repository https://dl-3.alpinelinux.org/alpine/edge/testing add \
                incron && \
            echo "root" > /etc/incron.allow && \
            # http://kubernetes.io/docs/user-guide/accessing-the-cluster/#accessing-the-api-from-a-pod
            # https://stackoverflow.com/questions/30690186/how-do-i-access-the-kubernetes-api-from-within-a-pod-container

ENTRYPOINT  ["/entrypoint.sh"]
CMD         ["incrond", "-n"]
