#！/bin/bash
FikkerInstallDir="/root" # default installation directory
FikkerNewVersion="fikkerd-3.7.6-linux-x86-64" # package name
service iptables stop
chkconfig iptables off
service httpd stop
service nginx stop
chkconfig httpd off
chkconfig nginx off
systemctl stop firewalld.service
systemctl disable firewalld.service
systemctl stop httpd.service
systemctl stop nginx.service
systemctl disable httpd.service
systemctl disable nginx.service
yum -y install wget
cd $FikkerInstallDir
wget -c --no-check-certificate https://raw.githubusercontent.com/xu5343/fikker/main/$FikkerNewVersion.tar.gz && tar zxf $FikkerNewVersion.tar.gz && rm -rf $FikkerNewVersion.tar.gz && cd $FikkerNewVersion && ./fikkerd.sh install && ./fikkerd.sh start && cd $FikkerInstallDir && sleep 5 && echo 'finished!'
echo "添加定时任务：每8小时重启fikker服务定时任务"
# 判断文件夹是否存在
if [ ! -e /var/spool/cron/ ];then
mkdir -p /var/spool/cron/
fi
# 添加定时任务：每8小时重启fikker服务
if [ `grep -v '^\s*#' /var/spool/cron/root |grep -c '/data/socket'` -eq 0 ];then
echo "0 */8 * * * /etc/init.d/fikkerd restart"  >> /var/spool/cron/root
fi
echo "检查crontab定时任务增加情况"
crontab -l
echo "登录 Fikker 管理后台：http://your-fikker-ip:6780/，管理员的初始密码：123456" 
