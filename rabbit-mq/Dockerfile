FROM rabbitmq:3.8.3
ENV RABBITMQ_USE_LONGNAME=true \
    AUTOCLUSTER_LOG_LEVEL=debug \
    AUTOCLUSTER_CLEANUP=true \
    CLEANUP_INTERVAL=60 \
    CLEANUP_WARN_ONLY=false \
    AUTOCLUSTER_TYPE=k8s \
    LANG=en_US.UTF-8
ADD plugins/ /usr/lib/rabbitmq/plugins/
RUN rabbitmq-plugins enable --offline autocluster
RUN rabbitmq-plugins enable --offline rabbitmq_management