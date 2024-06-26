# Replace "kafka-console-consumer.sh" 
# by "kafka-console-consumer" or "kafka-console-consumer.bat" based on your system # (or bin/kafka-console-consumer.sh or bin\windows\kafka-console-consumer.bat if you didn't setup PATH / Environment variables)

############################
### CONDUKTOR PLATFORM #####
############################ 

# create a topic with 3 partitions
kafka-topics.sh --command-config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --topic third_topic --create --partitions 3

# start one consumer
# tạo 1 consumer được gắn vào nhóm 1 nhóm bất kỳ
kafka-console-consumer.sh --consumer.config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --topic third_topic --group my-first-application

# start one producer and start producing
# Khởi động 1 produce và gửi message
kafka-console-producer.sh --producer.config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner --topic third_topic 

# start another consumer part of the same group. See messages being spread
# Số lượng consumer tăng lên 4 thì sẽ có 1 consumer không nhận được tin nhắn
kafka-console-consumer.sh --consumer.config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --topic third_topic --group my-first-application

# start another consumer part of a different group from beginning
# tạo 1 consumer với id-group khác(sẽ nhận về tất cả các message của id-group khác đã nhận)
kafka-console-consumer.sh --consumer.config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --topic third_topic --group my-second-application --from-beginning


############################
#####     LOCALHOST    #####
############################

# create a topic with 3 partitions
kafka-topics.sh --bootstrap-server localhost:9092 --topic third_topic --create --partitions 3

# start one consumer
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic third_topic --group my-first-application

# start one producer and start producing
kafka-console-producer.sh --bootstrap-server localhost:9092 --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner --topic third_topic

# start another consumer part of the same group. See messages being spread
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic third_topic --group my-first-application

# start another consumer part of a different group from beginning
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic third_topic --group my-second-application --from-beginning