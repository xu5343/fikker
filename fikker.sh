#！/bin/bash
service iptables stop 2> /dev/null ; chkconfig iptables off 2> /dev/null ; service httpd stop 2> /dev/null ; service nginx stop 2> /dev/null ; chkconfig httpd off 2> /dev/null ; chkconfig nginx off 2> /dev/null ; systemctl stop firewalld.service 2> /dev/null ; systemctl disable firewalld.service 2> /dev/null ; systemctl stop httpd.service 2> /dev/null ; systemctl stop nginx.service 2> /dev/null ; systemctl disable httpd.service 2> /dev/null ; systemctl disable nginx.service 2> /dev/null ; if [ -f "/usr/bin/apt-get" ]; then apt-get install -y wget tar; fi ; if [ -f "/usr/bin/yum" ]; then yum install -y wget tar; fi ;
mkdir fikker
cd fikker
wget http://xl.1syan.com/files/fikker.zip
yum install unzip -y
unzip fikker.zip
chmod -R 777 ../fikker
bash fikkerd.sh install
bash fikkerd.sh start
