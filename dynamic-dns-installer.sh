#!/bin/bash

# Call this script with sudo for a one-time password entry
sudo apt update
sudo apt install ddclient libjson-any-perl libdata-validate-ip-perl
wget https://files.pimylifeup.com/portforwarding/ddclient-3.9.1.tar.gz
tar -zxvf ddclient-3.9.1.tar.gz
sudo cp -f ddclient-3.9.1/ddclient /usr/sbin/ddclient
sudo mkdir /etc/ddclient
sudo mv /etc/ddclient.conf /etc/ddclient
CONF=/etc/ddclient/ddclient.conf
echo "use=web, web=checkip.dyndns.com/, web-skip='IP Address'" > "$CONF"
{
  echo "ssl=yes"
  echo "protocol=dyndns2"
  echo "server=dynupdate.no-ip.com"
  echo "login=your_username"
  echo "password=your_password"
  echo "your_domain.com"
  echo "run_daemon='true'"
  echo "run_dhclient='false'"
  echo "run_ipup='false'"
} >> "$CONF"
# sudo service ddclient start
# sudo service ddclient status
UPDATEIP_CRON_FILE=/etc/cron.weekly/ddclient
echo "#!/bin/sh" > "$UPDATEIP_CRON_FILE"
echo "/usr/sbin/ddclient -force" >> "$UPDATEIP_CRON_FILE"
sudo chmod +x "$UPDATEIP_CRON_FILE"
echo "run 'vim $CONF' to change the login, password, and domain you created on noip.org"
# for debugging:
# sudo ddclient -daemon=0 -debug -verbose -noquiet