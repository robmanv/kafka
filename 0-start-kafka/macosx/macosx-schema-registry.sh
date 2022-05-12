# Baixar schema-registry do confluent

curl -O http://packages.confluent.io/archive/6.1/confluent-community-6.1.1.tar.gz

# Unzip
tar xzvf confluent-community-6.1.1.tar.gz

# SET ENVIRONMENT VARIABLE
vi ~/.bash_profile
i
export CONFLUENT_HOME=/Users/robsvel/confluent-6.1.1
:wq

#RECARREGAR VARIAVEIS DE AMBIENTE PERMANENTEMENTE
source ~/.bash_profile

#Configure zookeper
cd $CONFLUENT_HOME/etc/kafka
vi zookeeper.properties
listeners=PLAINTEXT://127.0.0.1:9092
listeners=PLAINTEXT://localhost:9092

#edit schema-registry.properties
listeners=http://<FQDN or IP of your host>:8081
listeners=http://localhost:8081
kafkastore.bootstrap.servers=PLAINTEXT://<FQDN or IP of your broker host>:9092
kafkastore.bootstrap.servers=PLAINTEXT://localhost:9092
mode.mutability=true

#Start Schema-registry server
$CONFLUENT_HOME/bin/zookeeper-server-start $CONFLUENT_HOME/etc/kafka/zookeeper.properties
$CONFLUENT_HOME/bin/kafka-server-start $CONFLUENT_HOME/etc/kafka/server.properties
$CONFLUENT_HOME/bin/schema-registry-start $CONFLUENT_HOME/etc/schema-registry/schema-registry.propertie

OU

# Se ja tiver uma instalação do kafka na maquina
docker run -p 8081:8081 -e  SCHEMA_REGISTRY_KAFKASTORE_CONNECTION_URL=host.docker.internal:2181  -e SCHEMA_REGISTRY_HOST_NAME=localhost  -e SCHEMA_REGISTRY_LISTENERS=http://0.0.0.0:8081  -e SCHEMA_REGISTRY_DEBUG=true confluentinc/cp-schema-registry:5.3.2

