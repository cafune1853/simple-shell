#!/bin/bash
mentionStr="112 Host message list\n1. 10.112.32.64 fs-marketing-provider fs-marketing-task fs-marketing-statistic-provider fs-enterprise-relation-all-provider\n2. 10.112.32.23 wechat-union相关 wechat-sender-provider\n3. 10.112.32.51 wechat-proxy相关\no. 手工输入ip"
source `dirname "$0"`/.pwd
pwd=$FIRSTSHARE_PWD
while true
do 
	echo -e $mentionStr
	echo "Please pick one host to login:"
	exitRe="^exit$"
	otherRe="^o$"
	numberRe='^[0-9]+$'
	read hostNo
	# do exit
	if [[ $hostNo =~ $exitRe ]]
	then exit
	fi
	# do manual input ip
	if [[ $hostNo =~ $otherRe ]]
	then
		echo "Please input ip:"
		read ip
		sshpass -p "$pwd" ssh $ip
	fi
	#only number passed
	if ! [[ $hostNo =~ $numberRe ]]
	then echo -e "Error: Please input correct host number.\n"
		continue
	fi
	if [ $hostNo -eq 1 ] 
	then
		sshpass -p "$pwd" ssh 10.112.32.64 
	elif [ $hostNo -eq 2 ]
	then
		sshpass -p "$pwd" ssh 10.112.32.23
	elif [ $hostNo -eq 3 ]
	then
		sshpass -p "$pwd" ssh 10.112.32.51
	else
		echo "Error: Please input correct host number."
	fi
	echo -e ""
done
