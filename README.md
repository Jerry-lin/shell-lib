# shell-lib
a common library of shell that contains log, time etc.


# agent
```shell
for _host in  hdp07.bigdata.fosun.com hdp08.bigdata.fosun.com hdp09.bigdata.fosun.com hdp10.bigdata.fosun.com hdp11.bigdata.fosun.com hdp12.bigdata.fosun.com hdp13.bigdata.fosun.com hdp14.bigdata.fosun.com hdp15.bigdata.fosun.com kafka01.bigdata.fosun.com kafka02.bigdata.fosun.com kafka03.bigdata.fosun.com master01.bigdata.fosun.com master02.bigdata.fosun.com master03.bigdata.fosun.com master05.bigdata.fosun.com master11.bigdata.fosun.com master12.bigdata.fosun.com
do 
	ssh $_host "rpm -ivh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-1.el7.noarch.rpm; yum install -y zabbix-agent"
done

# config
for _host in  hdp07.bigdata.fosun.com hdp08.bigdata.fosun.com hdp09.bigdata.fosun.com hdp10.bigdata.fosun.com hdp11.bigdata.fosun.com hdp12.bigdata.fosun.com hdp13.bigdata.fosun.com hdp14.bigdata.fosun.com hdp15.bigdata.fosun.com kafka01.bigdata.fosun.com kafka02.bigdata.fosun.com kafka03.bigdata.fosun.com master01.bigdata.fosun.com master02.bigdata.fosun.com master03.bigdata.fosun.com master05.bigdata.fosun.com master11.bigdata.fosun.com master12.bigdata.fosun.com
do 
ssh $_host "
echo '$_host';
echo '
	PidFile=/var/run/zabbix/zabbix_agentd.pid
	LogFile=/var/log/zabbix/zabbix_agentd.log
	LogFileSize=0
	Server=util02.bigdata.fosun.com
	ServerActive=util02.bigdata.fosun.com
	Hostname=$_host
	Include=/etc/zabbix/zabbix_agentd.d/*.conf
' > /etc/zabbix/zabbix_agentd.conf"
done


for _host in  hdp07.bigdata.fosun.com hdp08.bigdata.fosun.com hdp09.bigdata.fosun.com hdp10.bigdata.fosun.com hdp11.bigdata.fosun.com hdp12.bigdata.fosun.com hdp13.bigdata.fosun.com hdp14.bigdata.fosun.com hdp15.bigdata.fosun.com kafka01.bigdata.fosun.com kafka02.bigdata.fosun.com kafka03.bigdata.fosun.com master01.bigdata.fosun.com master02.bigdata.fosun.com master03.bigdata.fosun.com master05.bigdata.fosun.com master11.bigdata.fosun.com master12.bigdata.fosun.com
do 
ssh $_host "
echo ' ----$_host---- ';
systemctl restart zabbix-agent"
done
```

