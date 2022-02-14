ARG STACK_VERSION

FROM docker.elastic.co/beats/filebeat:${STACK_VERSION}
COPY filebeat.yml /usr/share/filebeat/filebeat.yml

# Need root to read /var/lib/docker/containers/*/*.log
USER root

RUN chmod 744 /usr/share/filebeat/filebeat.yml
