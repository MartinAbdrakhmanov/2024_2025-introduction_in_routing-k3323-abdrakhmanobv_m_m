/interface bridge
add name=loopback0
add name=vpn
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/interface vpls
add disabled=no l2mtu=1500 mac-address=02:D5:99:AF:81:85 name=eovpls remote-peer=172.16.6.2 vpls-id=65500:666
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/routing ospf instance
set [ find default=yes ] router-id=172.16.1.2
/interface bridge port
add bridge=vpn interface=ether3
add bridge=vpn interface=eovpls
/ip address
add address=172.31.255.30/30 interface=ether1 network=172.31.255.28
add address=172.16.1.2 interface=loopback0 network=172.16.1.2
add address=172.16.1.101/30 interface=ether4 network=172.16.1.100
add address=172.16.3.101/30 interface=ether3 network=172.16.3.100
add address=172.16.4.101/30 interface=ether5 network=172.16.4.100
add address=10.10.66.2/24 interface=vpn network=10.10.66.0
/mpls ldp
set enabled=yes lsr-id=172.16.1.2 transport-address=172.16.1.2
/mpls ldp interface
add interface=ether3
add interface=ether4
add interface=ether5
/routing ospf network
add area=backbone network=172.16.1.100/30
add area=backbone network=172.16.3.100/30
add area=backbone network=172.16.4.100/30
add area=backbone network=172.16.1.2/32
/system identity
set name=R01.SPB 
