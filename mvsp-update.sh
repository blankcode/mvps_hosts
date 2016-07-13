########
# MVPs Host Block file updater 2016-07-12
#   mvps_update.sh
#   Written by:
#     Brian Blankenship
#       brianblankenship1978@gmail.com
########

## No Error handling and no testing :(

mkdir /etc/tmpbb #Make a tmp dir
cd /etc/tmpbb #go to tmp dir
curl -k http://winhelp2002.mvps.org/hosts.zip > hosts.zip #download the hosts file from mvps and save to hosts.zip
unzip hosts.zip #inflate hosts.zip
cat HOSTS > /etc/hosts #replace the /etc/hosts file with the new one
rm -rf /etc/tmpbb #remove the tmp dir
dscacheutil -flushcache #reset the DNS Cache and initialize the new hosts file

exit 0 #Exit and leave
