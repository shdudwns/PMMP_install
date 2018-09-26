#!/bin/bash
echo "PocketMine-MP 설치중......";
wget https://jenkins.pmmp.io/job/PocketMine-MP/lastSuccessfulBuild/artifact/PocketMine-MP.phar;
echo "PHP바이너리 설치중.....";
wget https://jenkins.pmmp.io/job/PHP-7.2-Linux-x86_64/lastSuccessfulBuild/artifact/PHP_Linux-x86_64.tar.gz;
tar -xzvf PHP_Linux-x86_64.tar.gz;
echo "start.sh 설치중";
wget https://raw.githubusercontent.com/pmmp/PocketMine-MP/master/start.sh;
chmod 777 start.sh;
echo "설치완료!!";
