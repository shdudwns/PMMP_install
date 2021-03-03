#!/bin/bash
echo "PocketMine-MP 설치중......";
wget https://jenkins.pmmp.io/job/PocketMine-MP/lastBuild/artifact/PocketMine-MP.phar;
echo "PHP바이너리 설치중.....";
wget https://jenkins.pmmp.io/job/PHP-7.4-Linux-x86_64/9/artifact/PHP_Linux-x86_64.tar.gz;
tar -xzvf PHP_Linux-x86_64.tar.gz;
echo "start.sh 설치중";
wget https://raw.githubusercontent.com/pmmp/PocketMine-MP/master/start.sh;
chmod 777 start.sh;
echo "설치완료!!";
EXTENSION_DIR=$(find "$(pwd)/bin" -name *debug-zts*);
grep -q '^extension_dir' bin/php7/bin/php.ini && sed -i'bak' "s{^extension_dir=.*{extension_dir=\"$EXTENSION_DIR\"{" bin/php7/bin/php.ini || echo "extension_dir=\"$EXTENSION_DIR\"" >> bin/php7/bin/php.ini;
