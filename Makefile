
CONFLUENT_PATH := ../confluent-5.1.2

run-kafka:
	${CONFLUENT_PATH}/bin/confluent start

TOPIC = "ga_test.*"

run-consumer:
	${CONFLUENT_PATH}/bin/kafka-console-consumer --bootstrap-server localhost:9092 --whitelist ${TOPIC} --from-beginning

run-avro-consumer:
	${CONFLUENT_PATH}/bin/kafka-avro-console-consumer --bootstrap-server localhost:9092 --whitelist ${TOPIC} --from-beginning

run-producer:
	${CONFLUENT_PATH}/bin/kafka-console-producer --broker-list localhost:9092 --topic blub

list-topics:
	${CONFLUENT_PATH}/bin/kafka-topics --list --zookeeper localhost:2181

basejar:
	mvn clean package -DskipTests

testjar:
	mkdir -p etc/kafka-connect/jars/

testjar/kafka-connect-ga-1.0.0-rc1.jar: basejar testjar
	cp target/kafka-connect-ga-1.0.0-rc1.jar etc/kafka-connect/jars/kafka-connect-ga-1.0.0-rc1.jar

test-run: etc/kafka-connect/jars/kafka-connect-ga-1.0.0-rc1.jar
	${CONFLUENT_PATH}/bin/connect-standalone etc/kafka-connect/connect-standalone.properties etc/kafka-connect/test-conf.properties
