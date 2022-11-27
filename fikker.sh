#！/bin/bash
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
