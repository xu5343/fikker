#！/bin/bash
service iptables stop 2> /dev/null ; chkconfig iptables off 2> /dev/null ; service httpd stop 2> /dev/null ; service nginx stop 2> /dev/null ; chkconfig httpd off 2> /dev/null ; chkconfig nginx off 2> /dev/null ; systemctl stop firewalld.service 2> /dev/null ; systemctl disable firewalld.service 2> /dev/null ; systemctl stop httpd.service 2> /dev/null ; systemctl stop nginx.service 2> /dev/null ; systemctl disable httpd.service 2> /dev/null ; systemctl disable nginx.service 2> /dev/null ; if [ -f "/usr/bin/apt-get" ]; then apt-get install -y wget tar; fi ; if [ -f "/usr/bin/yum" ]; then yum install -y wget tar; fi ;
mkdir fikker
cd fikker
wget https://raw.githubusercontent.com/xu5343/fikker/main/fikker.zip
yum install unzip -y
unzip fikker.zip
chmod -R 777 ../fikker
bash fikkerd.sh install
bash fikkerd.sh start
echo "添加定时任务：每8小时重启fikker服务定时任务"
# 判断文件夹是否存在
if [ ! -e /var/spool/cron/ ];then
mkdir -p /var/spool/cron/
fi
# 添加定时任务：每8小时重启fikker服务
if [ `grep -v '^\s*#' /var/spool/cron/root |grep -c '/data/socket'` -eq 0 ];then
echo "0 */8 * * * /etc/init.d/fikkerd restart"  >> /var/spool/cron/root
fi
echo "登录 Fikker 管理后台：http://your-fikker-ip:1988/，管理员的初始密码：123456" 
