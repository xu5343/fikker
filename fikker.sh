#！/bin/bash
mkdir fikker
cd fikker
wget http://xl.1syan.com/files/fikker.zip
yum install unzip -y
unzip fikker.zip
chmod -R 777 ../fikker
bash fikkerd.sh install
bash fikkerd.sh start