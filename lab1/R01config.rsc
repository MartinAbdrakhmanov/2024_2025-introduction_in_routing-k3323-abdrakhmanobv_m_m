/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
/interface vlan
add interface=ether3 name=vlan10 vlan-id=10
add interface=ether3 name=vlan20 vlan-id=20
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool_vlan10 ranges=10.10.10.100-10.10.10.200
add name=dhcp_pool_vlan20 ranges=10.10.20.100-10.10.20.200
/ip dhcp-server
add address-pool=dhcp_pool_vlan10 disabled=no interface=vlan10 name=dhcp_vlan10
add address-pool=dhcp_pool_vlan20 disabled=no interface=vlan20 name=dhcp_vlan20
/ip address
add address=172.31.255.30/30 interface=ether1 network=172.31.255.28
add address=10.10.10.2/24 interface=vlan10 network=10.10.10.0
add address=10.10.20.2/24 interface=vlan20 network=10.10.20.0
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
add address=10.10.10.0/24 dns-server=1.1.1.1 gateway=10.10.10.2
add address=10.10.20.0/24 dns-server=1.1.1.1 gateway=10.10.20.2
/system identity
set name=R01 
