#！/bin/bash
echo "添加定时任务：每7小时30分钟重启fikker服务定时任务"
# 判断文件夹是否存在
LOG_FILE="/root/fikkerd_restart.log"
while true; do
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Restarting fikkerd service" | tee -a $LOG_FILE
    /etc/init.d/fikkerd restart
    if [ $? -eq 0 ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - fikkerd service restarted successfully" | tee -a $LOG_FILE
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to restart fikkerd service" | tee -a $LOG_FILE
    fi
    sleep 27000  # 7小时30分钟 = 7*3600 + 30*60 秒
done
echo "登录 Fikker 管理后台：http://your-fikker-ip:6780/，管理员的初始密码：123456" 
