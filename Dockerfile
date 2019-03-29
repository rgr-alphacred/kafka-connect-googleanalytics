ARG KAFKA_CONNECT_VERSION="5.1.2"
FROM confluentinc/cp-kafka-connect:$KAFKA_CONNECT_VERSION
MAINTAINER richard.guitter@euranova.eu

LABEL description="Kafka connector to fetch a view from Google Analytics. (Demo project)"

ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components,/etc/kafka-connect/jars/"

COPY target/kafka-connect-ga-*.jar /etc/kafka-connect/jars/

CMD ["/etc/confluent/docker/run"]
