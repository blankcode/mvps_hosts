########
# MVPs Host Block file updater 2016-07-12 for MAC
#   mvps_update_new.sh
#   Written by (Who):
#     Brian Blankenship <brianblankenship1978@gmail.com>
#   Why:
#     I made this in a pinch for an aunt of my wife.
#   How:
#     Add a cron job to update regularly.
#     You need root privleges.
########

[[ -d /etc/MVP ]] && { mkdir /etc/MVP; }; # Make a tmp dir if not already there.
cd /etc/MVP; # go to tmp dir.
curl http://winhelp2002.mvps.org/hosts.zip > hosts.zip; # download the hosts file from mvps and save to hosts.zip.
unzip hosts.zip; # inflate hosts.zip.
NEW_FILE=$(md5sum HOSTS); OLD_HOSTS=$(md5sum /etc/hosts); #Set the MD5SUMs from the files.
[[ "$NEW_FILE" == "$OLD_HOSTS" ]] || { cat HOSTS > /etc/hosts; rm HOSTS hosts.zip }; # replace the /etc/hosts file with the new one if the new one is different.
dscacheutil -flushcache; # reset the DNS Cache and initialize the new hosts file.
unset NEW_FILE; unset OLD_HOSTS; #Clear the variables.

exit 0; # Exit well and leave.
