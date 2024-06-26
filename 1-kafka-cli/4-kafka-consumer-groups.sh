 # Replace "kafka-consumer-groups.sh" 
# by "kafka-consumer-groups" or "kafka-consumer-groups.bat" based on your system # (or bin/kafka-consumer-groups.sh or bin\windows\kafka-consumer-groups.bat if you didn't setup PATH / Environment variables)


############################
### CONDUKTOR PLATFORM #####
############################ 


# documentation for the command 
kafka-consumer-groups.sh 

# list consumer groups
# Danh sách nhóm consumer
kafka-consumer-groups.sh --command-config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --list --timeout 80000
 
# describe one specific group
# mô tả thông tin chi tiết về một nhóm consumer cụ thể my-second-application
kafka-consumer-groups.sh --command-config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --describe --group my-second-application --timeout 80000

# describe another group
# mô tả thông tin chi tiết về một nhóm consumer cụ thể my-first-application
kafka-consumer-groups.sh --command-config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --describe --group my-first-application --timeout 80000

# start a consumer
kafka-console-consumer.sh --consumer.config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --topic first_topic --group my-first-application

# describe the group now
kafka-consumer-groups.sh --command-config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --describe --group my-first-application

# describe a console consumer group (change the end number)
kafka-consumer-groups.sh --command-config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --describe --group console-consumer-10592

# start a console consumer
kafka-console-consumer.sh --consumer.config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --topic first_topic --group my-first-application

# describe the group again
kafka-consumer-groups.sh --command-config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --describe --group my-first-application


############################
#####     LOCALHOST    #####
############################


# documentation for the command 
kafka-consumer-groups.sh 

# list consumer groups
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list
 
# describe one specific group
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my-second-application

# describe another group
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my-first-application

# start a consumer
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic first_topic --group my-first-application

# describe the group now
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my-first-application

# describe a console consumer group (change the end number)
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group console-consumer-10592

# start a console consumer
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic first_topic --group my-first-application

# describe the group again
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my-first-application