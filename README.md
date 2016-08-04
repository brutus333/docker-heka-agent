### Description

This image uses heka agent with DockerLogInput & DockerEventInput plugins for gathering data from docker daemon and with kafka output plugin.

Since the container needs access to /var/run/docker.sock to gather docker events and logs the aforementioned file should be mapped as a volume inside the container.

There are two environment variables which govern the configuration of kafka output plugin, namely KAFKA_SERVERS and KAFKA_TOPIC.

KAFKA_SEVERS should contain the list of tuples servername:port separated by comma, while KAFKA_TOPIC contain the name of the Kafka topic where the messages will be created. The same topic should be configured on hekad server as well.

If hekad server was configured to send the logs to elasticsearch, the indices will have the names dockerlog* and dockervent*. 
