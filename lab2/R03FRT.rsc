/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool_frt ranges=192.168.30.100-192.168.30.200
/ip dhcp-server
add address-pool=dhcp_pool_frt disabled=no interface=ether5 name=dhcp_frt
/ip address
add address=172.31.255.30/30 interface=ether1 network=172.31.255.28
add address=172.20.0.3/24 interface=ether3 network=172.20.0.0
add address=172.30.0.3/24 interface=ether4 network=172.30.0.0
add address=192.168.30.2/24 interface=ether5 network=192.168.30.0
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
add address=192.168.30.0/24 dns-server=8.8.8.8 gateway=192.168.30.2
/ip route
add distance=1 dst-address=192.168.10.0/24 gateway=172.30.0.2
add distance=1 dst-address=192.168.20.0/24 gateway=172.20.0.2
/system identity
set name=R03.FRT 
