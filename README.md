# rpi-home-vpn
simplifies the setup for this guide (https://pimylifeup.com/raspberry-pi-vpn-server/) with condensed scripts 

# from the rpi 
curl -L https://install.pivpn.io | bash
sudo pivpn add
# the client name you choose will from hereon be called {pivpnClientName}
hostname -I
# from your host machine
# connect to rpi with filezilla {host: sftp://${hostname -I result}, username: pi, password: yourPassword}
# copy /home/pi/ovpns/{pivpnClientName}.ovpn from rpi to hostmachine

