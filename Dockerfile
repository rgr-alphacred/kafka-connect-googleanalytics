ARG KAFKA_CONNECT_VERSION="5.1.2"
ARG CONNECTOR_VERSION="1.0.0"
FROM confluentinc/cp-kafka-connect:$KAFKA_CONNECT_VERSION
MAINTAINER richard.guitter@euranova.eu

LABEL version=$CONNECTOR_VERSION \
      description="Kafka connector to fetch a view from Google Analytics. (Demo project)"

COPY target/kafka-connect-ga-${CONNECTOR_VERSION}.jar /usr/share/java
ENV CONNECT_PLUGIN_PATH="/usr/share/java"

ENTRYPOINT ["tail", "-f", "/dev/null"]