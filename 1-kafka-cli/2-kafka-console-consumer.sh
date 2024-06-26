# Replace "kafka-console-consumer.sh" 
# by "kafka-console-consumer" or "kafka-console-consumer.bat" based on your system # (or bin/kafka-console-consumer.sh or bin\windows\kafka-console-consumer.bat if you didn't setup PATH / Environment variables)

kafka-console-consumer.sh 

############################
### CONDUKTOR PLATFORM #####
############################ 

# create a topic with 3 partitions
kafka-topics.sh --command-config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --topic second_topic --create --partitions 3

# consuming
# mở terminal để lắng nghe 1 toptic
kafka-console-consumer.sh --consumer.config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --topic second_topic

# other terminal
# Lệnh bạn đã cung cấp sử dụng Kafka console producer để gửi tin nhắn tới một Kafka topic cụ thể với các cấu hình chi tiết
# Tùy chọn này chỉ định rằng producer sẽ sử dụng RoundRobinPartitioner để phân vùng tin nhắn. 
# RoundRobinPartitioner là một class được Kafka cung cấp, nó thực hiện việc phân phối các tin nhắn một cách tuần tự (round-robin) 
# Giữa các partition của topic. Điều này giúp đảm bảo rằng tải được phân phối đều giữa các partition
kafka-console-producer.sh --producer.config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner --topic second_topic

# consuming from beginning
# Tùy chọn này chỉ định rằng consumer sẽ đọc và tiêu thụ tất cả các tin nhắn từ đầu topic (kể từ tin nhắn đầu tiên). 
# Nếu không có tùy chọn này, consumer chỉ đọc các tin nhắn mới được gửi vào topic sau khi consumer đã kết nối
kafka-console-consumer.sh --consumer.config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --topic second_topic --from-beginning

# display key, values and timestamp in consumer
# Hiển thị đầy đủ các thuộc tính của tin nhắn (dấu thời gian, key, value, và phân vùng) 
# giúp bạn phân tích và kiểm toán dữ liệu trong Kafka một cách dễ dàng và hiệu quả.
kafka-console-consumer.sh --consumer.config playground.config --bootstrap-server adapted-skunk-13673-eu2-kafka.upstash.io:9092 --topic second_topic --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true --property print.partition=true --from-beginning



############################
#####     LOCALHOST    #####
############################

# create a topic with 3 partitions
kafka-topics.sh --bootstrap-server localhost:9092 --topic second_topic --create --partitions 3

# consuming
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic second_topic

# other terminal
kafka-console-producer.sh --bootstrap-server localhost:9092 --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner --topic second_topic

# consuming from beginning
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic second_topic --from-beginning

# display key, values and timestamp in consumer
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic second_topic --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true --property print.partition=true --from-beginning