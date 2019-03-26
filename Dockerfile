FROM confluentinc/cp-kafka-connect:5.1.2
MAINTAINER richard.guitter@euranova.eu

LABEL version="${CONNECTOR_VERSION}" \
      description="Kafka connector to fetch a view from Google Analytics. (Demo project)"

ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components,/etc/kafka-connect/jars/"

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:latest


#ARG CONNECTOR_VERSION="1.0.0"
#ARG KAFKA_CONNECT_VERSION="5.1.2"
#FROM confluentinc/cp-kafka-connect:$KAFKA_CONNECT_VERSION

#COPY target/kafka-connect-ga-$CONNECTOR_VERSION.jar /usr/share/java/
COPY target/kafka-connect-ga-1.0.0-rc1.jar /etc/kafka-connect/jars/

#ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD ["/etc/confluent/docker/run"]
