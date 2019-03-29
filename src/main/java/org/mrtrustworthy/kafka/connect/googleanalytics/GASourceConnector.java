package org.mrtrustworthy.kafka.connect.googleanalytics;

import org.apache.kafka.common.config.ConfigDef;
import org.apache.kafka.connect.connector.Task;
import org.apache.kafka.connect.source.SourceConnector;
import org.mrtrustworthy.kafka.connect.googleanalytics.source.GAConnectorConfig;
import org.mrtrustworthy.kafka.connect.googleanalytics.source.GASourceTask;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Map;

public class GASourceConnector extends SourceConnector{

    private static final Logger logger = LoggerFactory.getLogger(GASourceConnector.class);

    private GAConnectorConfig config;


    @Override
    public String version() {
        return "1.0.0-rc1";
    }

    @Override
    public Class<? extends Task> taskClass() {
        return GASourceTask.class;
    }

    @Override
    public List<Map<String, String>> taskConfigs(int i) {
        logger.info("Creating task configs");
        return this.config.createTaskConfigurations(i);
    }

    @Override
    public void start(Map<String, String> map) {
        this.config = GAConnectorConfig.fromConfigMap(map);
        logger.info("Starting GASourceConnector with config {}.", config);
    }

    @Override
    public void stop() {
        logger.info("stopping GASourceConnector.");
    }

    @Override
    public ConfigDef config() {
        return GAConnectorConfig.CONFIG_DEF;
    }
}
