#!/bin/bash
sudo chmod 755 /home/ec2-user/sb_code1/target/springbootApp.jar
sudo nohup java -jar /home/ec2-user/sb_code1/targe/springbootApp.jar 1> /dev/null 2>&1 &
echo $! > pid.file