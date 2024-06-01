
#  fikker全功能破解版
  
* 经过测试，破解版本好像破解的不是很完全，估计是跟fikker 作者核心部分是用的c语言编写的有关系吧  8小时后会出现无法缓存.  
* 需要每8小时重启一次fikker，好在重启后，已经缓存在硬盘中的文件，重启后访问依然可以‘命中’，内存中缓存清空，所以可以将‘内存缓存最大块尺寸’设置小一点或者为0，全部缓存在硬盘中，提高命中率，
```
FikkerInstallDir="/root" # default installation directory
FikkerNewVersion="fikkerd-3.7.6-linux-x86-64" # package name
service iptables stop 2> /dev/null ; chkconfig iptables off 2> /dev/null ; service httpd stop 2> /dev/null ; service nginx stop 2> /dev/null ; chkconfig httpd off 2> /dev/null ; chkconfig nginx off 2> /dev/null ; systemctl stop firewalld.service 2> /dev/null ; systemctl disable firewalld.service 2> /dev/null ; systemctl stop httpd.service 2> /dev/null ; systemctl stop nginx.service 2> /dev/null ; systemctl disable httpd.service 2> /dev/null ; systemctl disable nginx.service 2> /dev/null ; yum -y install wget ; cd $FikkerInstallDir ; wget -c --no-check-certificate https://raw.githubusercontent.com/xu5343/fikker/main/$FikkerNewVersion.tar.gz && tar zxf $FikkerNewVersion.tar.gz && rm -rf $FikkerNewVersion.tar.gz && cd $FikkerNewVersion && chmod u+x fikkerd.sh && ./fikkerd.sh install && ./fikkerd.sh start && cd $FikkerInstallDir && sleep 5 && echo 'finished!' && cd $FikkerInstallDir && wget --no-check-certificate https://raw.githubusercontent.com/xu5343/fikker/main/fikker.sh && chmod +x fikker.sh && sh fikker.sh && echo "/usr/bin/sh /usr/local/bin/fikker.sh &" >> /etc/rc.d/rc.local
```  
### 相关命令
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
	
cd /root && cd fikkerd-3.?.?-linux-x86-?? && ./fikkerd.sh stop 2> /dev/null ; sleep 2 ; ./fikkerd.sh uninstall ; cd /root && rm -rf fikkerd-3.?.?-linux-x86-?? && echo 'finished!'
```  
最后破解不彻底的解决办法 ,没8个小时重启一下fikker

```
echo "0 */8 * * * /etc/init.d/fikkerd restart " >>/etc/crontab
```
