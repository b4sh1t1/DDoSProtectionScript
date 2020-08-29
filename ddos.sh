#!/usr/bin/env bash


# Date of write: 8/7/2020
# I had made this for the purpose that people are lazy & i just felt the need to help people out. So hopefully it covers basics

# This script is made to protect your server(s) from ddos attack(s) 

#i have added various types of blocking, checking, & logging. Hope you like it, if not well then....uhhh well everyone is entitled to there opinion. 

# IG: @imdoxed 
# OGU: obstacles
# Twitter: @ItsObstacles

done = "You're done now! Your server is now under some protection!"


iptables -t mangle -A PREROUTING -m conntrack --ctstate INVALID -j DROP
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A FORWARD -m state --state INVALID -j DROP
iptables -A OUTPUT -m state --state INVALID -j DROP
iptables -t mangle -A PREROUTING -p tcp ! --syn -m conntrack --ctstate NEW -j DROP
iptables -t mangle -A PREROUTING -p tcp -m conntrack --ctstate NEW -m tcpmss ! --mss 536:65535 -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,ACK FIN -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ACK,URG URG -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ACK,FIN FIN -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ACK,PSH PSH -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL ALL -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL NONE -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL FIN,PSH,URG -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL SYN,FIN,PSH,URG -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP
iptables -t mangle -A PREROUTING -s 224.0.0.0/3 -j DROP
iptables -t mangle -A PREROUTING -s 169.254.0.0/16 -j DROP
iptables -t mangle -A PREROUTING -s 172.16.0.0/12 -j DROP
iptables -t mangle -A PREROUTING -s 192.0.2.0/24 -j DROP
iptables -t mangle -A PREROUTING -s 192.168.0.0/16 -j DROP
iptables -t mangle -A PREROUTING -s 10.0.0.0/8 -j DROP
iptables -t mangle -A PREROUTING -s 0.0.0.0/8 -j DROP
iptables -t mangle -A PREROUTING -s 240.0.0.0/5 -j DROP
iptables -t mangle -A PREROUTING -s 127.0.0.0/8 ! -i lo -j DROP
sleep 2 #sleep statement
iptables -t mangle -A PREROUTING -p icmp -j DROP
iptables -t mangle -A PREROUTING -f -j DROP
iptables -A INPUT -p tcp -m connlimit --connlimit-above 111 -j REJECT --reject-with tcp-reset
iptables -A INPUT -p tcp --tcp-flags RST RST -m limit --limit 2/s --limit-burst 2 -j ACCEPT
iptables -A INPUT -p tcp --tcp-flags RST RST -j DROP
iptables -A INPUT -p tcp -m conntrack --ctstate NEW -m limit --limit 60/s --limit-burst 20 -j ACCEPT
iptables -A INPUT -p tcp -m conntrack --ctstate NEW -j DROP
iptables -A INPUT -p tcp --dport ssh -m conntrack --ctstate NEW -m recent --set
iptables -A INPUT -p tcp --dport ssh -m conntrack --ctstate NEW -m recent --update --seconds 60 --hitcount 10 -j DROP
iptables -N port-scanning
iptables -A port-scanning -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s --limit-burst 2 -j RETURN
iptables -A port-scanning -j DROP
echo Now blocking a good chunk of connection from China, sorry China. You have caused to many issues for the world. #FUCKCOVID-19 
iptables -A INPUT -s 192.168.0.0/16 -j DROP
iptables -A INPUT -s 101.248.0.0/15	-j DROP
iptables -A INPUT -s 101.248.0.0/16 -j DROP
iptables -A INPUT -s 103.8.32.0/24 -j DROP 
iptables -A INPUT -s 106.0.4.0/22 -j DROP 
iptables -A INPUT -s 106.108.0.0/15 -j DROP	
iptables -A INPUT -s 106.110.0.0/15 -j DROP	
iptables -A INPUT -s 106.112.0.0/14 -j DROP	
iptables -A INPUT -s 106.112.0.0/16 -j DROP	
iptables -A INPUT -s 106.113.0.0/16 -j DROP	
iptables -A INPUT -s 106.114.0.0/16 -j DROP
iptables -A INPUT -s 106.115.0.0/16 -j DROP
iptables -A INPUT -s 106.116.0.0/15 -j DROP	
iptables -A INPUT -s 106.116.0.0/16 -j DROP	
iptables -A INPUT -s 106.117.0.0/16 -j DROP		 	
iptables -A INPUT -s 106.118.0.0/16 -j DROP		 	
iptables -A INPUT -s 106.119.0.0/16 -j DROP		 	
iptables -A INPUT -s 106.122.0.0/16 -j DROP		 	
iptables -A INPUT -s 106.123.0.0/16 -j DROP		 	
iptables -A INPUT -s 106.124.0.0/16 -j DROP		 	
iptables -A INPUT -s 106.125.0.0/16 -j DROP		 	
iptables -A INPUT -s 106.126.0.0/16 -j DROP		 	
iptables -A INPUT -s 106.127.0.0/16 -j DROP
iptables -A INPUT -s 106.16.0.0/15 -j DROP	
iptables -A INPUT -s 106.18.0.0/15 -j DROP	
iptables -A INPUT -s 106.224.0.0/14 -j DROP	
iptables -A INPUT -s 106.228.0.0/16 -j DROP	
iptables -A INPUT -s 106.229.0.0/16 -j DROP	
iptables -A INPUT -s 106.230.0.0/16 -j DROP	
iptables -A INPUT -s 106.32.0.0/16 -j DROP	
iptables -A INPUT -s 106.33.0.0/16 -j DROP
iptables -A INPUT -s 106.34.0.0/16 -j DROP
iptables -A INPUT -s 106.35.0.0/16 -j DROP	
iptables -A INPUT -s 106.36.0.0/16 -j DROP	
iptables -A INPUT -s 106.40.0.0/16 -j DROP	
iptables -A INPUT -s 106.4.0.0/15 -j DROP
iptables -A INPUT -s 106.41.0.0/16 -j DROP	
iptables -A INPUT -s 106.42.0.0/16 -j DROP
iptables -A INPUT -s 106.43.0.0/16 -j DROP	
iptables -A INPUT -s 106.44.0.0/16 -j DROP	
iptables -A INPUT -s 106.45.0.0/16 -j DROP
iptables -A INPUT -s 106.46.0.0/16 -j DROP
iptables -A INPUT -s 106.56.0.0/15 -j DROP
iptables -A INPUT -s 106.58.0.0/15 -j DROP
iptables -A INPUT -s 106.60.0.0/15 -j DROP
iptables -A INPUT -s 106.6.0.0/16 -j DROP	
iptables -A INPUT -s 106.62.0.0/16 -j DROP
iptables -A INPUT -s 106.7.0.0/16 -j DROP	
iptables -A INPUT -s 106.80.0.0/15 -j DROP
iptables -A INPUT -s 106.8.0.0/16 -j DROP	
iptables -A INPUT -s 106.82.0.0/15 -j DROP	
iptables -A INPUT -s 106.84.0.0/15 -j DROP	
iptables -A INPUT -s 106.86.0.0/15 -j DROP	
iptables -A INPUT -s 106.88.0.0/15 -j DROP	
iptables -A INPUT -s 106.90.0.0/15 -j DROP	
iptables -A INPUT -s 106.9.0.0/16 -j DROP	
iptables -A INPUT -s 106.92.0.0/16 -j DROP	
iptables -A INPUT -s 110.152.0.0/14 -j DROP
iptables -A INPUT -s 110.156.0.0/15 -j DROP
iptables -A INPUT -s 110.166.0.0/15 -j DROP
iptables -A INPUT -s 110.176.0.0/13 -j DROP
iptables -A INPUT -s 110.184.0.0/13 -j DROP
iptables -A INPUT -s 110.190.90.0/24 -j DROP
iptables -A INPUT -s 110.190.91.0/24 -j DROP
iptables -A INPUT -s 110.190.92.0/24 -j DROP 
iptables -A INPUT -s 110.190.94.0/24	-j DROP 
iptables -A INPUT -s 110.80.0.0/13 -j DROP
iptables -A INPUT -s 110.88.0.0/14 -j DROP
iptables -A INPUT -s 111.112.0.0/15 -j DROP	
iptables -A INPUT -s 111.120.0.0/14 -j DROP	
iptables -A INPUT -s 111.124.0.0/16 -j DROP	
iptables -A INPUT -s 111.126.0.0/15 -j DROP	
iptables -A INPUT -s 111.170.0.0/16 -j DROP	
iptables -A INPUT -s 111.172.0.0/14 -j DROP	
iptables -A INPUT -s 111.176.0.0/13 -j DROP	
iptables -A INPUT -s 111.224.0.0/14 -j DROP	
iptables -A INPUT -s 111.72.0.0/13 -j DROP	
iptables -A INPUT -s 112.100.0.0/14 -j DROP
iptables -A INPUT -s 112.112.0.0/14 -j DROP
iptables -A INPUT -s 112.112.162.0/24 -j DROP
iptables -A INPUT -s 112.116.0.0/15 -j DROP
iptables -A INPUT -s 112.66.0.0/15 -j DROP	
iptables -A INPUT -s 112.98.0.0/15 -j DROP
iptables -A INPUT -s 113.112.0.0/13 -j DROP	
iptables -A INPUT -s 113.120.0.0/13 -j DROP
iptables -A INPUT -s 113.12.0.0/14 -j DROP
iptables -A INPUT -s 113.128.0.0/15 -j DROP
iptables -A INPUT -s 113.132.0.0/14 -j DROP	
iptables -A INPUT -s 113.136.0.0/13 -j DROP	
iptables -A INPUT -s 113.16.0.0/15 -j DROP		
iptables -A INPUT -s 113.214.0.0/15 -j DROP
iptables -A INPUT -s 113.218.0.0/15 -j DROP	
iptables -A INPUT -s 113.220.0.0/14 -j DROP	
iptables -A INPUT -s 113.240.0.0/13 -j DROP	
iptables -A INPUT -s 113.24.0.0/14 -j DROP	
iptables -A INPUT -s 113.248.0.0/14 -j DROP	
iptables -A INPUT -s 113.59.224.0/22 -j DROP	
iptables -A INPUT -s 113.62.0.0/15 -j DROP
iptables -A INPUT -s 113.64.0.0/11 -j DROP	
iptables -A INPUT -s 113.96.0.0/12 -j DROP	
iptables -A INPUT -s 114.104.0.0/14 -j DROP
sleep 2 #sleep statement
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP 
iptables -A INPIT -p tcp --tcp-flags ALL NONE -j DROP 
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP 
iptables -A INPUT -f -j DROP
iptables -A INPUT -p icmp -m icmp --icmp-type address-mask-request -j DROP
iptables -A INPUT -p icmp -m icmp --icmp-type timestamp-request -j DROP
iptables -A INPUT -p icmp -m icmp -m limit --limit 1/second -j ACCEPT
iptables -A INPUT -m recent --name portscan --rcheck --seconds 86400 -j portscan
iptables -A INPUT -m recent --name UDP_FLOOD --rcheck --seconds 86400 -j portscan 
iptables -A INPUT -p tcp -m tcp -m recent -m state --state NEW --name portscan --set -j portscan 
echo $done


