
##  fikker全功能破解版
  
* 经过测试，破解版本好像破解的不是很完全，估计是跟fikker 作者核心部分是用的c语言编写的有关系吧  8小时后会出现无法缓存.  
* 需要每8小时重启一次fikker，好在重启后，已经缓存在硬盘中的文件，重启后访问依然可以‘命中’，内存中缓存清空，所以可以将‘内存缓存最大块尺寸’设置小一点或者为0，全部缓存在硬盘中，提高命中率，
```
wget --no-check-certificate https://raw.githubusercontent.com/xu5343/fikker/main/fikker.sh && bash fikker.sh
```  
# 相关命令
a、停止 Fikker 程序的一键脚本：

```
service fikkerd stop ; sleep 5 ; echo 'finished!'
```
 

c、重启 Fikker 程序的一键脚本：

```
service fikkerd restart ; sleep 5 ; echo 'finished!'
``` 

d、完全卸载/完全删除 Fikker 程序的一键脚本（默认安装在 /root 目录下面）：、

```
cd /root && cd fikker && ./fikkerd.sh stop 2> /dev/null ; sleep 2 ; ./fikkerd.sh uninstall ; cd /root && rm -rf fikker && echo 'finished!'
```  
最后破解不彻底的解决办法 ,没8个小时重启一下fikker

```
echo "0 */8 * * * /etc/init.d/fikkerd restart " >>/etc/crontab
```
