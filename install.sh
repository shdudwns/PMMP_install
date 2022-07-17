#!/bin/bash
apt install jq -y;
mkdir pm
cd pm
echo "PocketMine-MP.phar 설치중"
curl https://update.pmmp.io/api?channel=stable | jq . > install.json;
a=$(jq ".download_url" install.json)
a1="${a%\"}"
a1="${a1#\"}"
wget "$a1"
echo "PHP바이너리 설치중.....";
wget https://jenkins.pmmp.io/job/PHP-8.0-Aggregate/29/artifact/PHP-8.0-Linux-x86_64.tar.gz
tar -xzvf PHP*.tar.gz
echo "start.sh 설치중"
wget https://raw.githubusercontent.com/pmmp/PocketMine-MP/master/start.sh
chmod 777 start.sh
echo "설치완료!!"
EXTENSION_DIR=$(find "$(pwd)/bin" -name *debug-zts*)
grep -q '^extension_dir' bin/php7/bin/php.ini && sed -i'bak' "s{^extension_dir=.*{extension_dir=\"$EXTENSION_DIR\"{" bin/php7/bin/php.ini || echo "extension_dir=\"$EXTENSION_DIR\"" >> bin/php7/bin/php.ini
