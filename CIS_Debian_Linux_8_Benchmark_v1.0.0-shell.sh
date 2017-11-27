#!/bin/bash
PROFILE=${1:-Level 1}

if [ "$PROFILE" = "Level 1" ] || [ "$PROFILE" = "Level 2" ]; then
  echo \*\*\*\* Executing Level 1 profile remediation
  #Restricting the Various File Systems Mounting CIS-1.1.1.1 to CIS-1.1.1.8
  echo
  echo \*\*\*\* Disabling\ mounting\ of\ freevxfs,\ jffs2,\ hfs,\ hfsplus,\ swuashfs,\ udf,\ vfat,\ dccp,\ sctp,\ rds\ and\ tipx \ filesystems
  echo "install cramfs /bin/true
install freevxfs /bin/true
install jffs2 /bin/true
install hfs /bin/true
install hfsplus /bin/true
install squashfs /bin/true
install udf /bin/true
install vfat /bin/true
install dccp /bin/true
install sctp /bin/true
install rds /bin/true
install tipc /bin/true" > /etc/modprobe.d/CIS.conf 
 
  # Create Separate Partition for /tmp CIS-1.1.2
  echo
  echo \*\*\*\* Create\ Separate\ Partition\ for\ /tmp
  echo Create\ Separate\ Partition\ for\ /tmp not configured.

  # Set nodev option for /tmp Partition CIS-1.1.3
  echo
  echo \*\*\*\* Set\ nodev\ option\ for\ /tmp\ Partition
  egrep -q "^(\s*\S+\s+)/tmp(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$" /etc/fstab && sed -ri "s/^(\s*\S+\s+)/tmp(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$/\1/tmp\2nodev\3\4/" /etc/fstab

  # Set nosuid option for /tmp Partition CIS-1.1.4
  echo
  echo \*\*\*\* Set\ nosuid\ option\ for\ /tmp\ Partition
  egrep -q "^(\s*\S+\s+)/tmp(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$" /etc/fstab && sed -ri "s/^(\s*\S+\s+)/tmp(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$/\1/tmp\2nosuid\3\4/" /etc/fstab

#  # Set noexec option for /tmp Partition 
#  echo
#  echo \*\*\*\* Set\ noexec\ option\ for\ /tmp\ Partition
#  egrep -q "^(\s*\S+\s+)/tmp(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$" /etc/fstab && sed -ri "s/^(\s*\S+\s+)/tmp(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$/\1/tmp\2noexec\3\4/" /etc/fstab

  # Create Separate Partition for /var CIS-1.1.5
  echo
  echo \*\*\*\* Create\ Separate\ Partition\ for\ /var
  echo Create\ Separate\ Partition\ for\ /var not configured.

  # Bind Mount the /var/tmp directory to /tmp CIS-1.1.6
  echo
  echo \*\*\*\* Bind\ Mount\ the\ /var/tmp\ directory\ to\ /tmp
  echo Bind\ Mount\ the\ /var/tmp\ directory\ to\ /tmp not configured.
  
  # Set Nodev option for /var/tmp Partition CIS-1.1.7
  echo
  echo \*\*\*\* Set\ nodev\ option\ for\ /var/tmp\ Partition
  egrep -q "^(\s*\S+\s+)/var/tmp(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$" /etc/fstab && sed -ri "s/^(\s*\S+\s+)/var/tmp(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$/\1/var/tmp\2nodev\3\4/" /etc/fstab
  
  # Set nosuid option for /var/tmp Partition CIS-1.1.8
  echo
  echo \*\*\*\* Set\ nosuid\ option\ for\ /var/tmp\ Partition
  egrep -q "^(\s*\S+\s+)/var/tmp(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$" /etc/fstab && sed -ri "s/^(\s*\S+\s+)/var/tmp(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$/\1/var/tmp\2nosuid\3\4/" /etc/fstab

  # Set noexec option for /var/tmp Partition CIS-1.1.9
  echo
  echo \*\*\*\* Set\ noexec\ option\ for\ /var/tmp\ Partition
  egrep -q "^(\s*\S+\s+)/var/tmp(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$" /etc/fstab && sed -ri "s/^(\s*\S+\s+)/var/tmp(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$/\1/var/tmp\2noexec\3\4/" /etc/fstab

  # Create Separate Partition for /var/log CIS-1.1.10
  echo
  echo \*\*\*\* Create\ Separate\ Partition\ for\ /var/log
  echo Create\ Separate\ Partition\ for\ /var/log not configured.

  # Create Separate Partition for /var/log/audit CIS-1.1.11
  echo
  echo \*\*\*\* Create\ Separate\ Partition\ for\ /var/log/audit
  echo Create\ Separate\ Partition\ for\ /var/log/audit not configured.

  # Create Separate Partition for /home CIS-1.1.12
  echo
  echo \*\*\*\* Create\ Separate\ Partition\ for\ /home
  echo Create\ Separate\ Partition\ for\ /home not configured.

  # Add nodev Option to /home CIS-1.1.13
  echo
  echo \*\*\*\* Add\ nodev\ Option\ to\ /home
  egrep -q "^(\s*\S+\s+)/home(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$" /etc/fstab && sed -ri "s/^(\s*\S+\s+)/home(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$/\1/home\2nodev\3\4/" /etc/fstab

  # Add nodev Option to /run/shm Partition CIS-1.1.14
  echo
  echo \*\*\*\* Add\ nodev\ Option\ to\ /run/shm\ Partition
  egrep -q "^(\s*\S+\s+)/run/shm(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$" /etc/fstab && sed -ri "s/^(\s*\S+\s+)/run/shm(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$/\1/run/shm\2nodev\3\4/" /etc/fstab

  # Add nosuid Option to /run/shm Partition CIS-1.1.15
  echo
  echo \*\*\*\* Add\ nosuid\ Option\ to\ /run/shm\ Partition
  egrep -q "^(\s*\S+\s+)/run/shm(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$" /etc/fstab && sed -ri "s/^(\s*\S+\s+)/run/shm(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$/\1/run/shm\2nosuid\3\4/" /etc/fstab

  # Add noexec Option to /run/shm Partition CIS-1.1.16
  echo
  echo \*\*\*\* Add\ noexec\ Option\ to\ /run/shm\ Partition
  egrep -q "^(\s*\S+\s+)/run/shm(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$" /etc/fstab && sed -ri "s/^(\s*\S+\s+)/run/shm(\s+\S+\s+\S+)(\s+\S+\s+\S+)(\s*#.*)?\s*$/\1/run/shm\2noexec\3\4/" /etc/fstab

  # Set Sticky Bit on All World-Writable Directories CIS-1.1.20
  echo
  echo \*\*\*\* Set\ Sticky\ Bit\ on\ All\ World-Writable\ Directories
  df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null | xargs chmod a+t

  # Disable Automounting CIS-1.1.21
  echo
  echo \*\*\*\* Disable\ Automounting
  systemctl is-enabled autofs && systemctl disable autofs
  update-rc.d autofs disable

  # Install AIDE CIS-1.3.1
  echo
  echo \*\*\*\* Installing\ AIDE
  dpkg -s aide || apt-get -y install aide

  # Implement Periodic Execution of File Integrity CIS-1.3.2
  echo
  echo \*\*\*\* Implement\ Periodic\ Execution\ of\ File\ Integrity
  (crontab -u root -l; crontab -u root -l | egrep -q "^0 5 \* \* \* /usr/sbin/aide --check$" || echo "0 5 * * * /usr/sbin/aide --check" ) | crontab -u root -

  # Set User/Group Owner on bootloader config CIS-1.4.1
  echo
  echo \*\*\*\* Set\ User/Group\ Owner\ on\ bootloader\ config
  chown 0:0 /boot/grub/grub.cfg

  # Set Permissions on bootloader config CIS-1.4.1
  echo
  echo \*\*\*\* Set\ Permissions\ on\ bootloader\ config
  chmod g-r-w-x,o-r-w-x /boot/grub/grub.cfg

  # Set Boot Loader Password CIS-1.4.2
  echo
  echo \*\*\*\* Set\ Boot\ Loader\ Password
  echo Set\ Boot\ Loader\ Password not configured.

  # Require Authentication for Single-User Mode CIS-1.4.3
  echo
  echo \*\*\*\* Require\ Authentication\ for\ Single-User\ Mode
  echo Require\ Authentication\ for\ Single-User\ Mode not configured.

  # Restrict Core Dumps CIS-1.5.1
  echo
  echo \*\*\*\* Restrict\ Core\ Dumps
  egrep -q "^(\s*)\*\s+hard\s+core\s+\S+(\s*#.*)?\s*$" /etc/security/limits.conf && sed -ri "s/^(\s*)\*\s+hard\s+core\s+\S+(\s*#.*)?\s*$/\1* hard core 0\2/" /etc/security/limits.conf || echo "* hard core 0" >> /etc/security/limits.conf
  egrep -q "^(\s*)fs.suid_dumpable\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)fs.suid_dumpable\s*=\s*\S+(\s*#.*)?\s*$/\1fs.suid_dumpable = 0\2/" /etc/sysctl.conf || echo "fs.suid_dumpable = 0" >> /etc/sysctl.conf
  sysctl -w fs.suid_dumpable=0

  # Enable Randomized Virtual Memory Region Placement CIS-1.5.3
  echo
  echo \*\*\*\* Enable\ Randomized\ Virtual\ Memory\ Region\ Placement
  egrep -q "^(\s*)kernel.randomize_va_space\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)kernel.randomize_va_space\s*=\s*\S+(\s*#.*)?\s*$/\1kernel.randomize_va_space = 2\2/" /etc/sysctl.conf || echo "kernel.randomize_va_space = 2" >> /etc/sysctl.conf
  sysctl -w kernel.randomize_va_space=2

  # Disable Prelink CIS-1.5.4
  echo
  echo \*\*\*\* Disable\ Prelink
  dpkg -s prelink && apt-get -y purge prelink

  # Ensure NIS is not installed
  echo
  echo \*\*\*\* Ensure\ NIS\ is\ not\ installed
  dpkg -s nis && apt-get -y purge nis

  # Ensure rsh server is not enabled
  echo
  echo \*\*\*\* Ensure\ rsh\ server\ is\ not\ enabled
  sed -ri "s/^shell/#shell/" /etc/inetd.conf
  sed -ri "s/^login/#login/" /etc/inetd.conf
  sed -ri "s/^exec/#exec/" /etc/inetd.conf

  # Ensure rsh client is not installed
  echo
  echo \*\*\*\* Ensure\ rsh\ client\ is\ not\ installed
  dpkg -s rsh-client && apt-get -y remove rsh-client
  dpkg -s rsh-redone-client && apt-get -y remove rsh-redone-client

  # Ensure talk server is not enabled
  echo
  echo \*\*\*\* Ensure\ talk\ server\ is\ not\ enabled
  sed -ri "s/^talk/#talk/" /etc/inetd.conf
  sed -ri "s/^ntalk/#ntalk/" /etc/inetd.conf

  # Ensure talk client is not installed
  echo
  echo \*\*\*\* Ensure\ talk\ client\ is\ not\ installed
  dpkg -s talk && apt-get -y remove talk

  # Ensure telnet server is not enabled
  echo
  echo \*\*\*\* Ensure\ telnet\ server\ is\ not\ enabled
  sed -ri "s/^telnet/#telnet/" /etc/inetd.conf

  # Ensure tftp-server is not enabled
  echo
  echo \*\*\*\* Ensure\ tftp-server\ is\ not\ enabled
  sed -ri "s/^tftp/#tftp/" /etc/inetd.conf

  # Ensure xinetd is not enabled
  echo
  echo \*\*\*\* Ensure\ xinetd\ is\ not\ enabled
  update-rc.d xinetd disable

  # Ensure chargen is not enabled CIS-2.1.1
  echo
  echo \*\*\*\* Ensure\ chargen\ is\ not\ enabled
  if [ -f /etc/xinetd.d/chargen ]; then 
  	sed -ri "s/^(\s+)disable(\s+)=(\s+)no/\tdisable\t\t= yes/g" /etc/xinetd.d/chargen
  fi

  # Ensure daytime is not enabled CIS-2.1.2
  echo
  echo \*\*\*\* Ensure\ daytime\ is\ not\ enabled
  if [ -f /etc/xinetd.d/daytime ]; then
  	 sed -ri "s/^(\s+)disable(\s+)=(\s+)no/\tdisable\t\t= yes/g" /etc/xinetd.d/daytime
  fi

  # Ensure echo is not enabled CIS-2.1.4
  echo
  echo \*\*\*\* Ensure\ echo\ is\ not\ enabled
  if [ -f /etc/xinetd.d/echo ]; then
	sed -ri "s/^(\s+)disable(\s+)=(\s+)no/\tdisable\t\t= yes/g" /etc/xinetd.d/echo
  fi

  # Ensure discard is not enabled CIS-2.1.3
  echo
  echo \*\*\*\* Ensure\ discard\ is\ not\ enabled
  if [ -f /etc/xinetd.d/discard ]; then
	sed -ri "s/^(\s+)disable(\s+)=(\s+)no/\tdisable\t\t= yes/g" /etc/xinetd.d/discard
  fi

  # Ensure time is not enabled CIS-2.1.5
  echo
  echo \*\*\*\* Ensure\ time\ is\ not\ enabled
  if [ -f /etc/xinetd.d/time ]; then
	sed -ri "s/^(\s+)disable(\s+)=(\s+)no/\tdisable\t\t= yes/g" /etc/xinetd.d/time
  fi

  # Ensure the X Window system is not installed
  echo
  echo \*\*\*\* Ensure\ the\ X\ Window\ system\ is\ not\ installed
  apt-get -y purge xserver-xorg-core*

  # Ensure Avahi Server is not enabled
  echo
  echo \*\*\*\* Ensure\ Avahi\ Server\ is\ not\ enabled
  systemctl disable avahi-daemon

  # Ensure DHCP Server is not enabled
  echo
  echo \*\*\*\* Ensure\ DHCP\ Server\ is\ not\ enabled
  update-rc.d isc-dhcp-server disable

  # Configure Network Time Protocol (NTP)
  echo
  echo \*\*\*\* Configure\ Network\ Time\ Protocol\ \(NTP\)
  dpkg -s ntp || apt-get -y install ntp
  egrep -q "^\s*restrict(\s+-4)?\s+default(\s+\S+)*(\s*#.*)?\s*$" /etc/ntp.conf && sed -ri "s/^(\s*)restrict(\s+-4)?\s+default(\s+[^[:space:]#]+)*(\s+#.*)?\s*$/\1restrict\2 default kod nomodify notrap nopeer noquery\4/" /etc/ntp.conf || echo "restrict default kod nomodify notrap nopeer noquery" >> /etc/ntp.conf 
  egrep -q "^\s*restrict\s+-6\s+default(\s+\S+)*(\s*#.*)?\s*$" /etc/ntp.conf && sed -ri "s/^(\s*)restrict\s+-6\s+default(\s+[^[:space:]#]+)*(\s+#.*)?\s*$/\1restrict -6 default kod nomodify notrap nopeer noquery\3/" /etc/ntp.conf || echo "restrict -6 default kod nomodify notrap nopeer noquery" >> /etc/ntp.conf 
  egrep -q "^(\s*)OPTIONS\s*=\s*\"(([^\"]+)?-u\s[^[:space:]\"]+([^\"]+)?|([^\"]+))\"(\s*#.*)?\s*$" /etc/sysconfig/ntpd && sed -ri '/^(\s*)OPTIONS\s*=\s*\"([^\"]*)\"(\s*#.*)?\s*$/ {/^(\s*)OPTIONS\s*=\s*\"[^\"]*-u\s+\S+[^\"]*\"(\s*#.*)?\s*$/! s/^(\s*)OPTIONS\s*=\s*\"([^\"]*)\"(\s*#.*)?\s*$/\1OPTIONS=\"\2 -u ntp:ntp\"\3/ }' /etc/sysconfig/ntpd && sed -ri "s/^(\s*)OPTIONS\s*=\s*\"([^\"]+\s+)?-u\s[^[:space:]\"]+(\s+[^\"]+)?\"(\s*#.*)?\s*$/\1OPTIONS=\"\2\-u ntp:ntp\3\"\4/" /etc/sysconfig/ntpd || echo "OPTIONS=\"-u ntp:ntp\"" >> /etc/sysconfig/ntpd
  echo Configure\ Network\ Time\ Protocol\ \(NTP\) - server not configured.

  # Ensure LDAP is not enabled
  echo
  echo \*\*\*\* Ensure\ LDAP\ is\ not\ enabled
  dpkg -s slapd && apt-get -y purge slapd

  # Configure Mail Transfer Agent for Local-Only Mode
  echo
  echo \*\*\*\* Configure\ Mail\ Transfer\ Agent\ for\ Local-Only\ Mode
  echo Configure\ Mail\ Transfer\ Agent\ for\ Local-Only\ Mode Linux custom object not configured.

  # Ensure rsync service is not enabled
  echo
  echo \*\*\*\* Ensure\ rsync\ service\ is\ not\ enabled
  dpkg -s rsync && sed -ri "s/^(\s*RSYNC_ENABLE\s*=\s*)\S+(\s*)/\1false\2/" /etc/default/rsync

  # Disable IP Forwarding
  echo
  echo \*\*\*\* Disable\ IP\ Forwarding
  egrep -q "^(\s*)net.ipv4.ip_forward\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.ip_forward\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.ip_forward = 0\2/" /etc/sysctl.conf || echo "net.ipv4.ip_forward = 0" >> /etc/sysctl.conf

  # Disable Send Packet Redirects
  echo
  echo \*\*\*\* Disable\ Send\ Packet\ Redirects
  egrep -q "^(\s*)net.ipv4.conf.all.send_redirects\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.conf.all.send_redirects\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.all.send_redirects = 0\2/" /etc/sysctl.conf || echo "net.ipv4.conf.all.send_redirects = 0" >> /etc/sysctl.conf
  egrep -q "^(\s*)net.ipv4.conf.default.send_redirects\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.conf.default.send_redirects\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.default.send_redirects = 0\2/" /etc/sysctl.conf || echo "net.ipv4.conf.default.send_redirects = 0" >> /etc/sysctl.conf

  # Disable Source Routed Packet Acceptance
  echo
  echo \*\*\*\* Disable\ Source\ Routed\ Packet\ Acceptance
  egrep -q "^(\s*)net.ipv4.conf.all.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.conf.all.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.all.accept_source_route = 0\2/" /etc/sysctl.conf || echo "net.ipv4.conf.all.accept_source_route = 0" >> /etc/sysctl.conf
  egrep -q "^(\s*)net.ipv4.conf.default.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.conf.default.accept_source_route\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.default.accept_source_route = 0\2/" /etc/sysctl.conf || echo "net.ipv4.conf.default.accept_source_route = 0" >> /etc/sysctl.conf

  # Disable ICMP Redirect Acceptance
  echo
  echo \*\*\*\* Disable\ ICMP\ Redirect\ Acceptance
  egrep -q "^(\s*)net.ipv4.conf.all.accept_redirects\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.conf.all.accept_redirects\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.all.accept_redirects = 0\2/" /etc/sysctl.conf || echo "net.ipv4.conf.all.accept_redirects = 0" >> /etc/sysctl.conf
  egrep -q "^(\s*)net.ipv4.conf.default.accept_redirects\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.conf.default.accept_redirects\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.default.accept_redirects = 0\2/" /etc/sysctl.conf || echo "net.ipv4.conf.default.accept_redirects = 0" >> /etc/sysctl.conf

  # Disable Secure ICMP Redirect Acceptance
  echo
  echo \*\*\*\* Disable\ Secure\ ICMP\ Redirect\ Acceptance
  egrep -q "^(\s*)net.ipv4.conf.all.secure_redirects\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.conf.all.secure_redirects\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.all.secure_redirects = 0\2/" /etc/sysctl.conf || echo "net.ipv4.conf.all.secure_redirects = 0" >> /etc/sysctl.conf
  egrep -q "^(\s*)net.ipv4.conf.default.secure_redirects\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.conf.default.secure_redirects\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.default.secure_redirects = 0\2/" /etc/sysctl.conf || echo "net.ipv4.conf.default.secure_redirects = 0" >> /etc/sysctl.conf

  # Log Suspicious Packets
  echo
  echo \*\*\*\* Log\ Suspicious\ Packets
  egrep -q "^(\s*)net.ipv4.conf.all.log_martians\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.conf.all.log_martians\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.all.log_martians = 1\2/" /etc/sysctl.conf || echo "net.ipv4.conf.all.log_martians = 1" >> /etc/sysctl.conf
  egrep -q "^(\s*)net.ipv4.conf.default.log_martians\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.conf.default.log_martians\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.default.log_martians = 1\2/" /etc/sysctl.conf || echo "net.ipv4.conf.default.log_martians = 1" >> /etc/sysctl.conf

  # Enable Ignore Broadcast Requests
  echo
  echo \*\*\*\* Enable\ Ignore\ Broadcast\ Requests
  egrep -q "^(\s*)net.ipv4.icmp_echo_ignore_broadcasts\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.icmp_echo_ignore_broadcasts\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.icmp_echo_ignore_broadcasts = 1\2/" /etc/sysctl.conf || echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" >> /etc/sysctl.conf

  # Enable Bad Error Message Protection
  echo
  echo \*\*\*\* Enable\ Bad\ Error\ Message\ Protection
  egrep -q "^(\s*)net.ipv4.icmp_ignore_bogus_error_responses\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.icmp_ignore_bogus_error_responses\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.icmp_ignore_bogus_error_responses = 1\2/" /etc/sysctl.conf || echo "net.ipv4.icmp_ignore_bogus_error_responses = 1" >> /etc/sysctl.conf

  # Enable RFC-recommended Source Route Validation
  echo
  echo \*\*\*\* Enable\ RFC-recommended\ Source\ Route\ Validation
  egrep -q "^(\s*)net.ipv4.conf.all.rp_filter\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.conf.all.rp_filter\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.all.rp_filter = 1\2/" /etc/sysctl.conf || echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.conf
  egrep -q "^(\s*)net.ipv4.conf.default.rp_filter\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.conf.default.rp_filter\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.conf.default.rp_filter = 1\2/" /etc/sysctl.conf || echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.conf

  # Enable TCP SYN Cookies
  echo
  echo \*\*\*\* Enable\ TCP\ SYN\ Cookies
  egrep -q "^(\s*)net.ipv4.tcp_syncookies\s*=\s*\S+(\s*#.*)?\s*$" /etc/sysctl.conf && sed -ri "s/^(\s*)net.ipv4.tcp_syncookies\s*=\s*\S+(\s*#.*)?\s*$/\1net.ipv4.tcp_syncookies = 1\2/" /etc/sysctl.conf || echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf

  # Install TCP Wrappers
  echo
  echo \*\*\*\* Install\ TCP\ Wrappers
  dpkg -s tcpd || apt-get -y install tcpd

  # Verify Permissions on /etc/hosts.allow
  echo
  echo \*\*\*\* Verify\ Permissions\ on\ /etc/hosts.allow
  chmod u+r+w-x,g+r-w-x,o+r-w-x /etc/hosts.allow

  # Verify Permissions on /etc/hosts.deny
  echo
  echo \*\*\*\* Verify\ Permissions\ on\ /etc/hosts.deny
  chmod u+r+w-x,g+r-w-x,o+r-w-x /etc/hosts.deny

  # Ensure Firewall is active
  echo
  echo \*\*\*\* Ensure\ Firewall\ is\ active
  dpkg -s iptables || apt-get -y install iptables
  dpkg -s iptables-persistent || apt-get -y install iptables-persistent
  update-rc.d netfilter-persistent enable

  # Install the rsyslog package
  echo
  echo \*\*\*\* Install\ the\ rsyslog\ package
  dpkg -s rsyslog || apt-get -y install rsyslog

  # Ensure the rsyslog Service is activated
  echo
  echo \*\*\*\* Ensure\ the\ rsyslog\ Service\ is\ activated
  systemctl enable rsyslog

  # Create and Set Permissions on rsyslog Log Files
  echo
  echo \*\*\*\* Create\ and\ Set\ Permissions\ on\ rsyslog\ Log\ Files
  echo Create\ and\ Set\ Permissions\ on\ rsyslog\ Log\ Files Linux custom object not configured.

  # Configure rsyslog to Send Logs to a Remote Log Host
  echo
  echo \*\*\*\* Configure\ rsyslog\ to\ Send\ Logs\ to\ a\ Remote\ Log\ Host
  echo Configure\ rsyslog\ to\ Send\ Logs\ to\ a\ Remote\ Log\ Host not configured.

  # Enable cron Daemon
  echo
  echo \*\*\*\* Enable\ cron\ Daemon
  systemctl enable cron
  systemctl enable anacron

  # Set User/Group Owner and Permission on /etc/crontab
  echo
  echo \*\*\*\* Set\ User/Group\ Owner\ and\ Permission\ on\ /etc/crontab
  chmod g-r-w-x,o-r-w-x /etc/crontab
  chown 0:0 /etc/crontab

  # Set User/Group Owner and Permission on /etc/cron.hourly
  echo
  echo \*\*\*\* Set\ User/Group\ Owner\ and\ Permission\ on\ /etc/cron.hourly
  chmod g-r-w-x,o-r-w-x /etc/cron.hourly/
  chown 0:0 /etc/cron.hourly/

  # Set User/Group Owner and Permission on /etc/cron.daily
  echo
  echo \*\*\*\* Set\ User/Group\ Owner\ and\ Permission\ on\ /etc/cron.daily
  chmod g-r-w-x,o-r-w-x /etc/cron.daily/
  chown 0:0 /etc/cron.daily/

  # Set User/Group Owner and Permission on /etc/cron.weekly
  echo
  echo \*\*\*\* Set\ User/Group\ Owner\ and\ Permission\ on\ /etc/cron.weekly
  chmod g-r-w-x,o-r-w-x /etc/cron.weekly/
  chown 0:0 /etc/cron.weekly/

  # Set User/Group Owner and Permission on /etc/cron.monthly
  echo
  echo \*\*\*\* Set\ User/Group\ Owner\ and\ Permission\ on\ /etc/cron.monthly
  chmod g-r-w-x,o-r-w-x /etc/cron.monthly/
  chown 0:0 /etc/cron.monthly/

  # Set User/Group Owner and Permission on /etc/cron.d
  echo
  echo \*\*\*\* Set\ User/Group\ Owner\ and\ Permission\ on\ /etc/cron.d
  chmod g-r-w-x,o-r-w-x /etc/cron.d/
  chown 0:0 /etc/cron.d/

  # Restrict at/cron to Authorized Users
  echo
  echo \*\*\*\* Restrict\ at/cron\ to\ Authorized\ Users
  rm -rf /etc/cron.deny
  touch /etc/cron.allow
  chmod g-r-w-x,o-r-w-x /etc/cron.allow
  chown 0:0 /etc/cron.allow
  rm -rf /etc/at.deny
  touch /etc/at.allow
  chmod g-r-w-x,o-r-w-x /etc/at.allow
  chown 0:0 /etc/at.allow

  # Set Password Creation Requirement Parameters Using pam_cracklib
  echo
  echo \*\*\*\* Set\ Password\ Creation\ Requirement\ Parameters\ Using\ pam_cracklib
  egrep -q "^\s*password\s+requisite\s+pam_cracklib.so\s+" /etc/pam.d/common-password && sed -ri '/^\s*password\s+requisite\s+pam_cracklib.so\s+/ { /^\s*password\s+requisite\s+pam_cracklib.so(\s+\S+)*(\s+try_first_pass)(\s+.*)?$/! s/^(\s*password\s+requisite\s+pam_cracklib.so\s+)(.*)$/\1try_first_pass \2/ }' /etc/pam.d/common-password || echo Set\ Password\ Creation\ Requirement\ Parameters\ Using\ pam_cracklib - /etc/pam.d/common-password not configured.
  egrep -q "^\s*password\s+requisite\s+pam_cracklib.so\s+" /etc/pam.d/common-password && sed -ri '/^\s*password\s+requisite\s+pam_cracklib.so\s+/ { /^\s*password\s+requisite\s+pam_cracklib.so(\s+\S+)*(\s+retry=[0-9]+)(\s+.*)?$/! s/^(\s*password\s+requisite\s+pam_cracklib.so\s+)(.*)$/\1retry=3 \2/ }' /etc/pam.d/common-password && sed -ri 's/(^\s*password\s+requisite\s+pam_cracklib.so(\s+\S+)*\s+)retry=[0-9]+(\s+.*)?$/\1retry=3\3/' /etc/pam.d/common-password || echo Set\ Password\ Creation\ Requirement\ Parameters\ Using\ pam_cracklib - /etc/pam.d/common-password not configured.
  egrep -q "^\s*password\s+requisite\s+pam_cracklib.so\s+" /etc/pam.d/common-password && sed -ri '/^\s*password\s+requisite\s+pam_cracklib.so\s+/ { /^\s*password\s+requisite\s+pam_cracklib.so(\s+\S+)*(\s+minlen=[0-9]+)(\s+.*)?$/! s/^(\s*password\s+requisite\s+pam_cracklib.so\s+)(.*)$/\1minlen=14 \2/ }' /etc/pam.d/common-password && sed -ri 's/(^\s*password\s+requisite\s+pam_cracklib.so(\s+\S+)*\s+)minlen=[0-9]+(\s+.*)?$/\1minlen=14\3/' /etc/pam.d/common-password || echo Set\ Password\ Creation\ Requirement\ Parameters\ Using\ pam_cracklib - /etc/pam.d/common-password not configured.
  egrep -q "^\s*password\s+requisite\s+pam_cracklib.so\s+" /etc/pam.d/common-password && sed -ri '/^\s*password\s+requisite\s+pam_cracklib.so\s+/ { /^\s*password\s+requisite\s+pam_cracklib.so(\s+\S+)*(\s+dcredit=-?[0-9]+)(\s+.*)?$/! s/^(\s*password\s+requisite\s+pam_cracklib.so\s+)(.*)$/\1dcredit=-1 \2/ }' /etc/pam.d/common-password && sed -ri 's/(^\s*password\s+requisite\s+pam_cracklib.so(\s+\S+)*\s+)dcredit=-?[0-9]+(\s+.*)?$/\1dcredit=-1\3/' /etc/pam.d/common-password || echo Set\ Password\ Creation\ Requirement\ Parameters\ Using\ pam_cracklib - /etc/pam.d/common-password not configured.
  egrep -q "^\s*password\s+requisite\s+pam_cracklib.so\s+" /etc/pam.d/common-password && sed -ri '/^\s*password\s+requisite\s+pam_cracklib.so\s+/ { /^\s*password\s+requisite\s+pam_cracklib.so(\s+\S+)*(\s+ucredit=-?[0-9]+)(\s+.*)?$/! s/^(\s*password\s+requisite\s+pam_cracklib.so\s+)(.*)$/\1ucredit=-1 \2/ }' /etc/pam.d/common-password && sed -ri 's/(^\s*password\s+requisite\s+pam_cracklib.so(\s+\S+)*\s+)ucredit=-?[0-9]+(\s+.*)?$/\1ucredit=-1\3/' /etc/pam.d/common-password || echo Set\ Password\ Creation\ Requirement\ Parameters\ Using\ pam_cracklib - /etc/pam.d/common-password not configured.
  egrep -q "^\s*password\s+requisite\s+pam_cracklib.so\s+" /etc/pam.d/common-password && sed -ri '/^\s*password\s+requisite\s+pam_cracklib.so\s+/ { /^\s*password\s+requisite\s+pam_cracklib.so(\s+\S+)*(\s+ocredit=-?[0-9]+)(\s+.*)?$/! s/^(\s*password\s+requisite\s+pam_cracklib.so\s+)(.*)$/\1ocredit=-1 \2/ }' /etc/pam.d/common-password && sed -ri 's/(^\s*password\s+requisite\s+pam_cracklib.so(\s+\S+)*\s+)ocredit=-?[0-9]+(\s+.*)?$/\1ocredit=-1\3/' /etc/pam.d/common-password || echo Set\ Password\ Creation\ Requirement\ Parameters\ Using\ pam_cracklib - /etc/pam.d/common-password not configured.
  egrep -q "^\s*password\s+requisite\s+pam_cracklib.so\s+" /etc/pam.d/common-password && sed -ri '/^\s*password\s+requisite\s+pam_cracklib.so\s+/ { /^\s*password\s+requisite\s+pam_cracklib.so(\s+\S+)*(\s+lcredit=-?[0-9]+)(\s+.*)?$/! s/^(\s*password\s+requisite\s+pam_cracklib.so\s+)(.*)$/\1lcredit=-1 \2/ }' /etc/pam.d/common-password && sed -ri 's/(^\s*password\s+requisite\s+pam_cracklib.so(\s+\S+)*\s+)lcredit=-?[0-9]+(\s+.*)?$/\1lcredit=-1\3/' /etc/pam.d/common-password || echo Set\ Password\ Creation\ Requirement\ Parameters\ Using\ pam_cracklib - /etc/pam.d/common-password not configured.

  # Limit Password Reuse
  echo
  echo \*\*\*\* Limit\ Password\ Reuse
  egrep -q "^\s*password\s+sufficient\s+pam_unix.so(\s+.*)$" /etc/pam.d/common-password && sed -ri '/^\s*password\s+sufficient\s+pam_unix.so\s+/ { /^\s*password\s+sufficient\s+pam_unix.so(\s+\S+)*(\s+remember=[0-9]+)(\s+.*)?$/! s/^(\s*password\s+sufficient\s+pam_unix.so\s+)(.*)$/\1remember=5 \2/ }' /etc/pam.d/common-password && sed -ri 's/(^\s*password\s+sufficient\s+pam_unix.so(\s+\S+)*\s+)remember=[0-9]+(\s+.*)?$/\1remember=5\3/' /etc/pam.d/common-password || echo Limit\ Password\ Reuse - /etc/pam.d/common-password not configured.

  # Set SSH Protocol to 2
  echo
  echo \*\*\*\* Set\ SSH\ Protocol\ to\ 2
  egrep -q "^(\s*)Protocol\s+\S+(\s*#.*)?\s*$" /etc/ssh/sshd_config && sed -ri "s/^(\s*)Protocol\s+\S+(\s*#.*)?\s*$/\1Protocol 2\2/" /etc/ssh/sshd_config || echo "Protocol 2" >> /etc/ssh/sshd_config

  # Set LogLevel to INFO
  echo
  echo \*\*\*\* Set\ LogLevel\ to\ INFO
  egrep -q "^(\s*)LogLevel\s+\S+(\s*#.*)?\s*$" /etc/ssh/sshd_config && sed -ri "s/^(\s*)LogLevel\s+\S+(\s*#.*)?\s*$/\1LogLevel INFO\2/" /etc/ssh/sshd_config || echo "LogLevel INFO" >> /etc/ssh/sshd_config

  # Set Permissions on /etc/ssh/sshd_config
  echo
  echo \*\*\*\* Set\ Permissions\ on\ /etc/ssh/sshd_config
  chown 0:0 /etc/ssh/sshd_config
  chmod u+r+w-x,g-r-w-x,o-r-w-x /etc/ssh/sshd_config

  # Disable SSH X11 Forwarding
  echo
  echo \*\*\*\* Disable\ SSH\ X11\ Forwarding
  egrep -q "^(\s*)X11Forwarding\s+\S+(\s*#.*)?\s*$" /etc/ssh/sshd_config && sed -ri "s/^(\s*)X11Forwarding\s+\S+(\s*#.*)?\s*$/\1X11Forwarding no\2/" /etc/ssh/sshd_config || echo "X11Forwarding no" >> /etc/ssh/sshd_config

  # Set SSH MaxAuthTries to 4 or Less
  echo
  echo \*\*\*\* Set\ SSH\ MaxAuthTries\ to\ 4\ or\ Less
  egrep -q "^(\s*)MaxAuthTries\s+\S+(\s*#.*)?\s*$" /etc/ssh/sshd_config && sed -ri "s/^(\s*)MaxAuthTries\s+\S+(\s*#.*)?\s*$/\1MaxAuthTries 4\2/" /etc/ssh/sshd_config || echo "MaxAuthTries 4" >> /etc/ssh/sshd_config

  # Set SSH IgnoreRhosts to Yes
  echo
  echo \*\*\*\* Set\ SSH\ IgnoreRhosts\ to\ Yes
  egrep -q "^(\s*)IgnoreRhosts\s+\S+(\s*#.*)?\s*$" /etc/ssh/sshd_config && sed -ri "s/^(\s*)IgnoreRhosts\s+\S+(\s*#.*)?\s*$/\1IgnoreRhosts yes\2/" /etc/ssh/sshd_config || echo "IgnoreRhosts yes" >> /etc/ssh/sshd_config

  # Set SSH HostbasedAuthentication to No
  echo
  echo \*\*\*\* Set\ SSH\ HostbasedAuthentication\ to\ No
  egrep -q "^(\s*)HostbasedAuthentication\s+\S+(\s*#.*)?\s*$" /etc/ssh/sshd_config && sed -ri "s/^(\s*)HostbasedAuthentication\s+\S+(\s*#.*)?\s*$/\1HostbasedAuthentication no\2/" /etc/ssh/sshd_config || echo "HostbasedAuthentication no" >> /etc/ssh/sshd_config

  # Disable SSH Root Login
  echo
  echo \*\*\*\* Disable\ SSH\ Root\ Login
  egrep -q "^(\s*)PermitRootLogin\s+\S+(\s*#.*)?\s*$" /etc/ssh/sshd_config && sed -ri "s/^(\s*)PermitRootLogin\s+\S+(\s*#.*)?\s*$/\1PermitRootLogin no\2/" /etc/ssh/sshd_config || echo "PermitRootLogin no" >> /etc/ssh/sshd_config

  # Set SSH PermitEmptyPasswords to No
  echo
  echo \*\*\*\* Set\ SSH\ PermitEmptyPasswords\ to\ No
  egrep -q "^(\s*)PermitEmptyPasswords\s+\S+(\s*#.*)?\s*$" /etc/ssh/sshd_config && sed -ri "s/^(\s*)PermitEmptyPasswords\s+\S+(\s*#.*)?\s*$/\1PermitEmptyPasswords no\2/" /etc/ssh/sshd_config || echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config

  # Do Not Allow Users to Set Environment Options
  echo
  echo \*\*\*\* Do\ Not\ Allow\ Users\ to\ Set\ Environment\ Options
  egrep -q "^(\s*)PermitUserEnvironment\s+\S+(\s*#.*)?\s*$" /etc/ssh/sshd_config && sed -ri "s/^(\s*)PermitUserEnvironment\s+\S+(\s*#.*)?\s*$/\1PermitUserEnvironment no\2/" /etc/ssh/sshd_config || echo "PermitUserEnvironment no" >> /etc/ssh/sshd_config

  # Use Only Approved Cipher in Counter Mode
  echo
  echo \*\*\*\* Use\ Only\ Approved\ Cipher\ in\ Counter\ Mode
  egrep -q "^(\s*)Ciphers\s+\S+(\s*#.*)?\s*$" /etc/ssh/sshd_config && sed -ri "s/^(\s*)Ciphers\s+\S+(\s*#.*)?\s*$/\1Ciphers aes128-ctr,aes192-ctr,aes256-ctr\2/" /etc/ssh/sshd_config || echo "Ciphers aes128-ctr,aes192-ctr,aes256-ctr" >> /etc/ssh/sshd_config

  # Set Idle Timeout Interval for User Login
  echo
  echo \*\*\*\* Set\ Idle\ Timeout\ Interval\ for\ User\ Login
  egrep -q "^(\s*)ClientAliveInterval\s+\S+(\s*#.*)?\s*$" /etc/ssh/sshd_config && sed -ri "s/^(\s*)ClientAliveInterval\s+\S+(\s*#.*)?\s*$/\1ClientAliveInterval 300\2/" /etc/ssh/sshd_config || echo "ClientAliveInterval 300" >> /etc/ssh/sshd_config
  egrep -q "^(\s*)ClientAliveCountMax\s+\S+(\s*#.*)?\s*$" /etc/ssh/sshd_config && sed -ri "s/^(\s*)ClientAliveCountMax\s+\S+(\s*#.*)?\s*$/\1ClientAliveCountMax 0\2/" /etc/ssh/sshd_config || echo "ClientAliveCountMax 0" >> /etc/ssh/sshd_config

  # Limit Access via SSH
  echo
  echo \*\*\*\* Limit\ Access\ via\ SSH
  echo Limit\ Access\ via\ SSH not configured.

  # Set SSH Banner
  echo
  echo \*\*\*\* Set\ SSH\ Banner
  egrep -q "^(\s*)Banner\s+\S+(\s*#.*)?\s*$" /etc/ssh/sshd_config && sed -ri "s/^(\s*)Banner\s+\S+(\s*#.*)?\s*$/\1Banner /etc/issue.net\2/" /etc/ssh/sshd_config || echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config

  # Restrict Access to the su Command
  echo
  echo \*\*\*\* Restrict\ Access\ to\ the\ su\ Command
  egrep -q "^\s*auth\s+required\s+pam_wheel.so(\s+.*)?$" /etc/pam.d/su && sed -ri '/^\s*auth\s+required\s+pam_wheel.so(\s+.*)?$/ { /^\s*auth\s+required\s+pam_wheel.so(\s+\S+)*(\s+use_uid)(\s+.*)?$/! s/^(\s*auth\s+required\s+pam_wheel.so)(\s+.*)?$/\1 use_uid\2/ }' /etc/pam.d/su || echo "auth required pam_wheel.so use_uid" >> /etc/pam.d/su

  # Set Password Expiration Days
  echo
  echo \*\*\*\* Set\ Password\ Expiration\ Days
  egrep -q "^(\s*)PASS_MAX_DAYS\s+\S+(\s*#.*)?\s*$" /etc/login.defs && sed -ri "s/^(\s*)PASS_MAX_DAYS\s+\S+(\s*#.*)?\s*$/\1PASS_MAX_DAYS 90\2/" /etc/login.defs || echo "PASS_MAX_DAYS 90" >> /etc/login.defs
  egrep "^[^:]+:[^\!\*]" /etc/shadow | cut -f1 -d ":" | xargs -n1 chage --maxdays 90

  # Set Password Change Minimum Number of Days
  echo
  echo \*\*\*\* Set\ Password\ Change\ Minimum\ Number\ of\ Days
  egrep -q "^(\s*)PASS_MIN_DAYS\s+\S+(\s*#.*)?\s*$" /etc/login.defs && sed -ri "s/^(\s*)PASS_MIN_DAYS\s+\S+(\s*#.*)?\s*$/\1PASS_MIN_DAYS 7\2/" /etc/login.defs || echo "PASS_MIN_DAYS 7" >> /etc/login.defs
  egrep "^[^:]+:[^\!\*]" /etc/shadow  | cut -f1 -d ":" | xargs -n1 chage --mindays 7

  # Set Password Expiring Warning Days
  echo
  echo \*\*\*\* Set\ Password\ Expiring\ Warning\ Days
  egrep -q "^(\s*)PASS_WARN_AGE\s+\S+(\s*#.*)?\s*$" /etc/login.defs && sed -ri "s/^(\s*)PASS_WARN_AGE\s+\S+(\s*#.*)?\s*$/\1PASS_WARN_AGE 7\2/" /etc/login.defs || echo "PASS_WARN_AGE 7" >> /etc/login.defs
  egrep "^[^:]+:[^\!\*]" /etc/shadow  | cut -f1 -d ":" | xargs -n1 chage --warndays 7

  # Disable System Accounts
  echo
  echo \*\*\*\* Disable\ System\ Accounts
  for user in `awk -F: '($3 < 1000) {print $1 }' /etc/passwd`; do
    if [ $user != "root" ]
    then
      /usr/sbin/usermod -L $user
      if [ $user != "sync" ] && [ $user != "shutdown" ] && [ $user != "halt" ]
      then
        /usr/sbin/usermod -s /usr/sbin/nologin $user
      fi
    fi
  done


  # Set Default Group for root Account
  echo
  echo \*\*\*\* Set\ Default\ Group\ for\ root\ Account
  usermod -g 0 root

  # Set Default umask for Users
  echo
  echo \*\*\*\* Set\ Default\ umask\ for\ Users
  egrep -q "^(\s*)umask\s+\S+(\s*#.*)?\s*$" /etc/bash.bashrc && sed -ri "s/^(\s*)umask\s+\S+(\s*#.*)?\s*$/\1umask 077\2/" /etc/bash.bashrc || echo "umask 077" >> /etc/bash.bashrc
  egrep -q "^(\s*)umask\s+\S+(\s*#.*)?\s*$" /etc/profile.d/cis.sh && sed -ri "s/^(\s*)umask\s+\S+(\s*#.*)?\s*$/\1umask 077\2/" /etc/profile.d/cis.sh || echo "umask 077" >> /etc/profile.d/cis.sh

  # Lock Inactive User Accounts
  echo
  echo \*\*\*\* Lock\ Inactive\ User\ Accounts
  useradd -D -f 35

  # Set Warning Banner for Standard Login Services CIS-1.7.1.4 to CIS-1.7.1.6
  echo
  echo \*\*\*\* Permission\ on\ /etc/motd,\ /etc/issue,\ /etc/issue.net\ are\ Configured
  chmod u+r+w-x,g+r-w-x,o+r-w-x /etc/motd
  chown 0:0 /etc/motd
  chmod u+r+w-x,g+r-w-x,o+r-w-x /etc/issue
  chown 0:0 /etc/issue
  chmod u+r+w-x,g+r-w-x,o+r-w-x /etc/issue.net
  chown 0:0 /etc/issue.net

  # Remove OS Information from Login Warning Banners CIS-1.7.1.1 to CIS-1.7.1.3
  echo
  echo \*\*\*\* Remove\ OS\ Information\ from\ Login\ Warning\ Banners
  sed -ri 's/(\\v|\\r|\\m|\\s)//g' /etc/issue
  sed -ri 's/(\\v|\\r|\\m|\\s)//g' /etc/issue.net
  sed -ri 's/(\\v|\\r|\\m|\\s)//g' /etc/motd

  # We are not remediating the CIS-1.7.2 as we are not using Graphical Interface for any of the Server
  # Verify Permissions on /etc/passwd
  echo
  echo \*\*\*\* Verify\ Permissions\ on\ /etc/passwd
  chmod u+r+w-x,g+r-w-x,o+r-w-x /etc/passwd

  # Verify Permissions on /etc/shadow
  echo
  echo \*\*\*\* Verify\ Permissions\ on\ /etc/shadow
  chmod u+r+w-x,g+r-w-x,o-r-w-x /etc/shadow

  # Verify Permissions on /etc/group
  echo
  echo \*\*\*\* Verify\ Permissions\ on\ /etc/group
  chmod u+r+w-x,g+r-w-x,o+r-w-x /etc/group

  # Verify User/Group Ownership on /etc/passwd
  echo
  echo \*\*\*\* Verify\ User/Group\ Ownership\ on\ /etc/passwd
  chown 0:0 /etc/passwd

  # Verify User/Group Ownership on /etc/shadow
  echo
  echo \*\*\*\* Verify\ User/Group\ Ownership\ on\ /etc/shadow
  chown 0:42 /etc/shadow

  # Verify User/Group Ownership on /etc/group
  echo
  echo \*\*\*\* Verify\ User/Group\ Ownership\ on\ /etc/group
  chown 0:0 /etc/group

  # Find Un-owned Files and Directories
  echo
  echo \*\*\*\* Find\ Un-owned\ Files\ and\ Directories
  echo Find\ Un-owned\ Files\ and\ Directories Linux custom object not configured.

  # Find Un-grouped Files and Directories
  echo
  echo \*\*\*\* Find\ Un-grouped\ Files\ and\ Directories
  echo Find\ Un-grouped\ Files\ and\ Directories Linux custom object not configured.

  # Ensure Password Fields are Not Empty
  echo
  echo \*\*\*\* Ensure\ Password\ Fields\ are\ Not\ Empty
  echo Ensure\ Password\ Fields\ are\ Not\ Empty not configured.

  # Verify No Legacy &quot;+&quot; Entries Exist in /etc/passwd File
  echo
  echo \*\*\*\* Verify\ No\ Legacy\ \&quot\;\+\&quot\;\ Entries\ Exist\ in\ /etc/passwd\ File
  sed -ri '/^\+:.*$/ d' /etc/passwd

  # Verify No Legacy &quot;+&quot; Entries Exist in /etc/shadow File
  echo
  echo \*\*\*\* Verify\ No\ Legacy\ \&quot\;\+\&quot\;\ Entries\ Exist\ in\ /etc/shadow\ File
  sed -ri '/^\+:.*$/ d' /etc/shadow

  # Verify No Legacy &quot;+&quot; Entries Exist in /etc/group File
  echo
  echo \*\*\*\* Verify\ No\ Legacy\ \&quot\;\+\&quot\;\ Entries\ Exist\ in\ /etc/group\ File
  sed -ri '/^\+:.*$/ d' /etc/group

  # Verify No UID 0 Accounts Exist Other Than root
  echo
  echo \*\*\*\* Verify\ No\ UID\ 0\ Accounts\ Exist\ Other\ Than\ root
  echo Verify\ No\ UID\ 0\ Accounts\ Exist\ Other\ Than\ root not configured.

  # Ensure root PATH Integrity
  echo
  echo \*\*\*\* Ensure\ root\ PATH\ Integrity
  echo Ensure\ root\ PATH\ Integrity Linux custom object not configured.

  # Check Permissions on User Home Directories
  echo
  echo \*\*\*\* Check\ Permissions\ on\ User\ Home\ Directories
  echo Check\ Permissions\ on\ User\ Home\ Directories Linux custom object not configured.

  # Check User Dot File Permissions
  echo
  echo \*\*\*\* Check\ User\ Dot\ File\ Permissions
  echo Check\ User\ Dot\ File\ Permissions Linux custom object not configured.

  # Check Permissions on User .netrc Files
  echo
  echo \*\*\*\* Check\ Permissions\ on\ User\ .netrc\ Files
  echo Check\ Permissions\ on\ User\ .netrc\ Files Linux custom object not configured.

  # Check for Presence of User .rhosts Files
  echo
  echo \*\*\*\* Check\ for\ Presence\ of\ User\ .rhosts\ Files
  echo Check\ for\ Presence\ of\ User\ .rhosts\ Files Linux custom object not configured.

  # Check Groups in /etc/passwd
  echo
  echo \*\*\*\* Check\ Groups\ in\ /etc/passwd
  echo Check\ Groups\ in\ /etc/passwd Linux custom object not configured.

  # Check That Users Are Assigned Valid Home Directories
  echo
  echo \*\*\*\* Check\ That\ Users\ Are\ Assigned\ Valid\ Home\ Directories
  echo Check\ That\ Users\ Are\ Assigned\ Valid\ Home\ Directories Linux custom object not configured.

  # Check User Home Directory Ownership
  echo
  echo \*\*\*\* Check\ User\ Home\ Directory\ Ownership
  echo Check\ User\ Home\ Directory\ Ownership Linux custom object not configured.

  # Check for Duplicate UIDs
  echo
  echo \*\*\*\* Check\ for\ Duplicate\ UIDs
  echo Check\ for\ Duplicate\ UIDs Linux custom object not configured.

  # Check for Duplicate GIDs
  echo
  echo \*\*\*\* Check\ for\ Duplicate\ GIDs
  echo Check\ for\ Duplicate\ GIDs Linux custom object not configured.

  # Check for Duplicate User Names
  echo
  echo \*\*\*\* Check\ for\ Duplicate\ User\ Names
  echo Check\ for\ Duplicate\ User\ Names Linux custom object not configured.

  # Check for Duplicate Group Names
  echo
  echo \*\*\*\* Check\ for\ Duplicate\ Group\ Names
  echo Check\ for\ Duplicate\ Group\ Names Linux custom object not configured.

  # Check for Presence of User .netrc Files
  echo
  echo \*\*\*\* Check\ for\ Presence\ of\ User\ .netrc\ Files
  echo Check\ for\ Presence\ of\ User\ .netrc\ Files Linux custom object not configured.

  # Check for Presence of User .forward Files
  echo
  echo \*\*\*\* Check\ for\ Presence\ of\ User\ .forward\ Files
  echo Check\ for\ Presence\ of\ User\ .forward\ Files Linux custom object not configured.

  # Ensure shadow group is empty
  echo
  echo \*\*\*\* Ensure\ shadow\ group\ is\ empty
  echo Ensure\ shadow\ group\ is\ empty Linux custom object not configured.
fi

if [ "$PROFILE" = "Level 2" ]; then
  echo \*\*\*\* Executing Level 2 profile remediation

  # Activate AppArmor
  echo
  echo \*\*\*\* Activate\ AppArmor
  echo AppArmor requires reboot to fully apply, may require manual remediation
  dpkg -s apparmor || apt-get -y install apparmor
  dpkg -s apparmor-profiles || apt-get -y install apparmor-profiles
  dpkg -s apparmor-utils || apt-get -y install apparmor-utils
  egrep -q "^(\s*)GRUB_CMDLINE_LINUX\s*=\s*\"([^\"]+)?\"(\s*#.*)?\s*$" /etc/default/grub && sed -ri '/^(\s*)GRUB_CMDLINE_LINUX\s*=\s*\"([^\"]*)?\"(\s*#.*)?\s*$/ {/^(\s*)GRUB_CMDLINE_LINUX\s*=\s*\"([^\"]+\s+)?apparmor=\S+(\s+[^\"]+)?\"(\s*#.*)?\s*$/! s/^(\s*GRUB_CMDLINE_LINUX\s*=\s*\"([^\"]+)?)(\"(\s*#.*)?\s*)$/\1 apparmor=1\3/ }' /etc/default/grub && sed -ri "s/^((\s*)GRUB_CMDLINE_LINUX\s*=\s*\"([^\"]+\s+)?)apparmor=\S+((\s+[^\"]+)?\"(\s*#.*)?\s*)$/\1apparmor=1\4/" /etc/default/grub || echo "GRUB_CMDLINE_LINUX=\"apparmor=1\"" >> /etc/default/grub
  egrep -q "^(\s*)GRUB_CMDLINE_LINUX\s*=\s*\"([^\"]+)?\"(\s*#.*)?\s*$" /etc/default/grub && sed -ri '/^(\s*)GRUB_CMDLINE_LINUX\s*=\s*\"([^\"]*)?\"(\s*#.*)?\s*$/ {/^(\s*)GRUB_CMDLINE_LINUX\s*=\s*\"([^\"]+\s+)?security=\S+(\s+[^\"]+)?\"(\s*#.*)?\s*$/! s/^(\s*GRUB_CMDLINE_LINUX\s*=\s*\"([^\"]+)?)(\"(\s*#.*)?\s*)$/\1 security=apparmor\3/ }' /etc/default/grub && sed -ri "s/^((\s*)GRUB_CMDLINE_LINUX\s*=\s*\"([^\"]+\s+)?)security=\S+((\s+[^\"]+)?\"(\s*#.*)?\s*)$/\1security=apparmor\4/" /etc/default/grub || echo "GRUB_CMDLINE_LINUX=\"security=apparmor\"" >> /etc/default/grub
  update-grub
  aa-enforce /etc/apparmor.d/*

  # Keep All Auditing Information
  echo
  echo \*\*\*\* Keep\ All\ Auditing\ Information
  egrep -q "^(\s*)max_log_file_action\s*=\s*\S+(\s*#.*)?\s*$" /etc/audit/auditd.conf && sed -ri "s/^(\s*)max_log_file_action\s*=\s*\S+(\s*#.*)?\s*$/\1max_log_file_action = keep_logs\2/" /etc/audit/auditd.conf || echo "max_log_file_action = keep_logs" >> /etc/audit/auditd.conf

  # Install and Enable auditd Service
  echo
  echo \*\*\*\* Install\ and\ Enable\ auditd\ Service
  dpkg -s auditd || apt-get -y install auditd
  systemctl enable auditd

  # Enable Auditing for Processes That Start Prior to auditd
  echo
  echo \*\*\*\* Enable\ Auditing\ for\ Processes\ That\ Start\ Prior\ to\ auditd
  egrep -q "^(\s*)GRUB_CMDLINE_LINUX\s*=\s*\"([^\"]+)?\"(\s*#.*)?\s*$" /etc/default/grub && sed -ri '/^(\s*)GRUB_CMDLINE_LINUX\s*=\s*\"([^\"]*)?\"(\s*#.*)?\s*$/ {/^(\s*)GRUB_CMDLINE_LINUX\s*=\s*\"([^\"]+\s+)?audit=\S+(\s+[^\"]+)?\"(\s*#.*)?\s*$/! s/^(\s*GRUB_CMDLINE_LINUX\s*=\s*\"([^\"]+)?)(\"(\s*#.*)?\s*)$/\1 audit=1\3/ }' /etc/default/grub && sed -ri "s/^((\s*)GRUB_CMDLINE_LINUX\s*=\s*\"([^\"]+\s+)?)audit=\S+((\s+[^\"]+)?\"(\s*#.*)?\s*)$/\1audit=1\4/" /etc/default/grub || echo "GRUB_CMDLINE_LINUX=\"audit=1\"" >> /etc/default/grub
  update-grub

  # Record Events That Modify Date and Time Information
  echo
  echo \*\*\*\* Record\ Events\ That\ Modify\ Date\ and\ Time\ Information
  uname -p | grep -q 'x86_64' && egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b64\s+-S\s+adjtimex\s+-S\s+settimeofday\s+-k\s+time-change\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change" >> /etc/audit/audit.rules
  egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b32\s+-S\s+adjtimex\s+-S\s+settimeofday\s+-S\s+stime\s+-k\s+time-change\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change" >> /etc/audit/audit.rules
  uname -p | grep -q 'x86_64' && egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b64\s+-S\s+clock_settime\s+-k\s+time-change\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b64 -S clock_settime -k time-change" >> /etc/audit/audit.rules
  egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b32\s+-S\s+clock_settime\s+-k\s+time-change\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b32 -S clock_settime -k time-change" >> /etc/audit/audit.rules
  egrep -q "^\s*-w\s+/etc/localtime\s+-p\s+wa\s+-k\s+time-change\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /etc/localtime -p wa -k time-change" >> /etc/audit/audit.rules


  # Record Events That Modify User/Group Information
  echo
  echo \*\*\*\* Record\ Events\ That\ Modify\ User/Group\ Information
  egrep -q "^\s*-w\s+/etc/group\s+-p\s+wa\s+-k\s+identity\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /etc/group -p wa -k identity" >> /etc/audit/audit.rules
  egrep -q "^\s*-w\s+/etc/passwd\s+-p\s+wa\s+-k\s+identity\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /etc/passwd -p wa -k identity" >> /etc/audit/audit.rules
  egrep -q "^\s*-w\s+/etc/gshadow\s+-p\s+wa\s+-k\s+identity\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /etc/gshadow -p wa -k identity" >> /etc/audit/audit.rules
  egrep -q "^\s*-w\s+/etc/shadow\s+-p\s+wa\s+-k\s+identity\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /etc/shadow -p wa -k identity" >> /etc/audit/audit.rules
  egrep -q "^\s*-w\s+/etc/security/opasswd\s+-p\s+wa\s+-k\s+identity\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /etc/security/opasswd -p wa -k identity" >> /etc/audit/audit.rules

  # Record Events That Modify the System's Network Environment
  echo
  echo \*\*\*\* Record\ Events\ That\ Modify\ the\ System\'s\ Network\ Environment
  uname -p | grep -q 'x86_64' && egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b64\s+-S\s+sethostname\s+-S\s+setdomainname\s+-k\s+system-locale\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale" >> /etc/audit/audit.rules
  egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b32\s+-S\s+sethostname\s+-S\s+setdomainname\s+-k\s+system-locale\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale" >> /etc/audit/audit.rules
  egrep -q "^\s*-w\s+/etc/issue\s+-p\s+wa\s+-k\s+system-locale\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /etc/issue -p wa -k system-locale" >> /etc/audit/audit.rules
  egrep -q "^\s*-w\s+/etc/issue.net\s+-p\s+wa\s+-k\s+system-locale\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /etc/issue.net -p wa -k system-locale" >> /etc/audit/audit.rules
  egrep -q "^\s*-w\s+/etc/hosts\s+-p\s+wa\s+-k\s+system-locale\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /etc/hosts -p wa -k system-locale" >> /etc/audit/audit.rules
  egrep -q "^\s*-w\s+/etc/sysconfig/network\s+-p\s+wa\s+-k\s+system-locale\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /etc/sysconfig/network -p wa -k system-locale" >> /etc/audit/audit.rules

  # Record Events That Modify the System's Mandatory Access Controls
  echo
  echo \*\*\*\* Record\ Events\ That\ Modify\ the\ System\'s\ Mandatory\ Access\ Controls
  egrep -q "^\s*-w\s+/etc/selinux/\s+-p\s+wa\s+-k\s+MAC-policy\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /etc/selinux/ -p wa -k MAC-policy" >> /etc/audit/audit.rules

  # Collect Login and Logout Events
  echo
  echo \*\*\*\* Collect\ Login\ and\ Logout\ Events
  egrep -q "^\s*-w\s+/var/log/faillog\s+-p\s+wa\s+-k\s+logins\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /var/log/faillog -p wa -k logins" >> /etc/audit/audit.rules
  egrep -q "^\s*-w\s+/var/log/lastlog\s+-p\s+wa\s+-k\s+logins\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /var/log/lastlog -p wa -k logins" >> /etc/audit/audit.rules
  egrep -q "^\s*-w\s+/var/log/tallylog\s+-p\s+wa\s+-k\s+logins\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /var/log/tallylog -p wa -k logins" >> /etc/audit/audit.rules

  # Collect Session Initiation Information
  echo
  echo \*\*\*\* Collect\ Session\ Initiation\ Information
  egrep -q "^\s*-w\s+/var/run/utmp\s+-p\s+wa\s+-k\s+session\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /var/run/utmp -p wa -k session" >> /etc/audit/audit.rules
  egrep -q "^\s*-w\s+/var/log/wtmp\s+-p\s+wa\s+-k\s+session\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /var/log/wtmp -p wa -k session" >> /etc/audit/audit.rules
  egrep -q "^\s*-w\s+/var/log/btmp\s+-p\s+wa\s+-k\s+session\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /var/log/btmp -p wa -k session" >> /etc/audit/audit.rules

  # Collect Discretionary Access Control Permission Modification Events
  echo
  echo \*\*\*\* Collect\ Discretionary\ Access\ Control\ Permission\ Modification\ Events
  uname -p | grep -q 'x86_64' && egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b64\s+-S\s+chmod\s+-S\s+fchmod\s+-S\s+fchmodat\s+-F\s+auid>=1000\s+-F\s+auid!=4294967295\s+-k\s+perm_mod\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod" >> /etc/audit/audit.rules
  egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b32\s+-S\s+chmod\s+-S\s+fchmod\s+-S\s+fchmodat\s+-F\s+auid>=1000\s+-F\s+auid!=4294967295\s+-k\s+perm_mod\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod" >> /etc/audit/audit.rules
  uname -p | grep -q 'x86_64' && egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b64\s+-S\s+chown\s+-S\s+fchown\s+-S\s+fchownat\s+-S\s+lchown\s+-F\s+auid>=1000\s+-F\s+auid!=4294967295\s+-k\s+perm_mod\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod" >> /etc/audit/audit.rules
  egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b32\s+-S\s+chown\s+-S\s+fchown\s+-S\s+fchownat\s+-S\s+lchown\s+-F\s+auid>=1000\s+-F\s+auid!=4294967295\s+-k\s+perm_mod\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod" >> /etc/audit/audit.rules
  uname -p | grep -q 'x86_64' && egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b64\s+-S\s+setxattr\s+-S\s+lsetxattr\s+-S\s+fsetxattr\s+-S\s+removexattr\s+-S\s+lremovexattr\s+-S\s+fremovexattr\s+-F\s+auid>=1000\s+-F\s+auid!=4294967295\s+-k\s+perm_mod\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod" >> /etc/audit/audit.rules
  egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b32\s+-S\s+setxattr\s+-S\s+lsetxattr\s+-S\s+fsetxattr\s+-S\s+removexattr\s+-S\s+lremovexattr\s+-S\s+fremovexattr\s+-F\s+auid>=1000\s+-F\s+auid!=4294967295\s+-k\s+perm_mod\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod" >> /etc/audit/audit.rules

  # Collect Unsuccessful Unauthorized Access Attempts to Files
  echo
  echo \*\*\*\* Collect\ Unsuccessful\ Unauthorized\ Access\ Attempts\ to\ Files
  uname -p | grep -q 'x86_64' && egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b64\s+-S\s+creat\s+-S\s+open\s+-S\s+openat\s+-S\s+truncate\s+-S\s+ftruncate\s+-F\s+exit=-EACCES\s+-F\s+auid>=1000\s+-F\s+auid!=4294967295\s+-k\s+access\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access" >> /etc/audit/audit.rules
  egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b32\s+-S\s+creat\s+-S\s+open\s+-S\s+openat\s+-S\s+truncate\s+-S\s+ftruncate\s+-F\s+exit=-EACCES\s+-F\s+auid>=1000\s+-F\s+auid!=4294967295\s+-k\s+access\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access" >> /etc/audit/audit.rules
  uname -p | grep -q 'x86_64' && egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b64\s+-S\s+creat\s+-S\s+open\s+-S\s+openat\s+-S\s+truncate\s+-S\s+ftruncate\s+-F\s+exit=-EPERM\s+-F\s+auid>=1000\s+-F\s+auid!=4294967295\s+-k\s+access\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access" >> /etc/audit/audit.rules
  egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b32\s+-S\s+creat\s+-S\s+open\s+-S\s+openat\s+-S\s+truncate\s+-S\s+ftruncate\s+-F\s+exit=-EPERM\s+-F\s+auid>=1000\s+-F\s+auid!=4294967295\s+-k\s+access\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access" >> /etc/audit/audit.rules

  # Collect Use of Privileged Commands
  echo
  echo \*\*\*\* Collect\ Use\ of\ Privileged\ Commands
  for file in `find / -xdev \( -perm -4000 -o -perm -2000 \) -type f`; do egrep -q "^\s*-a\s+(always,exit|exit,always)\s+-F\s+path=$file\s+-F\s+perm=x\s+-F\s+auid>=1000\s+-F\s+auid!=4294967295\s+-k\s+privileged\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F path=$file -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" >> /etc/audit/audit.rules; done

  # Collect Successful File System Mounts
  echo
  echo \*\*\*\* Collect\ Successful\ File\ System\ Mounts
  uname -p | grep -q 'x86_64' && egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b64\s+-S\s+mount\s+-F\s+auid>=1000\s+-F\s+auid!=4294967295\s+-k\s+mounts\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts" >> /etc/audit/audit.rules
  egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b32\s+-S\s+mount\s+-F\s+auid>=1000\s+-F\s+auid!=4294967295\s+-k\s+mounts\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts" >> /etc/audit/audit.rules

  # Collect File Deletion Events by User
  echo
  echo \*\*\*\* Collect\ File\ Deletion\ Events\ by\ User
  uname -p | grep -q 'x86_64' && egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b64\s+-S\s+unlink\s+-S\s+unlinkat\s+-S\s+rename\s+-S\s+renameat\s+-F\s+auid>=1000\s+-F\s+auid!=4294967295\s+-k\s+delete\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete" >> /etc/audit/audit.rules
  egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b32\s+-S\s+unlink\s+-S\s+unlinkat\s+-S\s+rename\s+-S\s+renameat\s+-F\s+auid>=1000\s+-F\s+auid!=4294967295\s+-k\s+delete\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete" >> /etc/audit/audit.rules

  # Collect Changes to System Administration Scope (sudoers)
  echo
  echo \*\*\*\* Collect\ Changes\ to\ System\ Administration\ Scope\ \(sudoers\)
  egrep -q "^\s*-w\s+/etc/sudoers\s+-p\s+wa\s+-k\s+scope\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /etc/sudoers -p wa -k scope" >> /etc/audit/audit.rules

  # Collect System Administrator Actions (sudolog)
  echo
  echo \*\*\*\* Collect\ System\ Administrator\ Actions\ \(sudolog\)
  egrep -q "^\s*-w\s+/var/log/sudo.log\s+-p\s+wa\s+-k\s+actions\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /var/log/sudo.log -p wa -k actions" >> /etc/audit/audit.rules

  # Collect Kernel Module Loading and Unloading
  echo
  echo \*\*\*\* Collect\ Kernel\ Module\ Loading\ and\ Unloading
  egrep -q "^\s*-w\s+/sbin/insmod\s+-p\s+x\s+-k\s+modules\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /sbin/insmod -p x -k modules" >> /etc/audit/audit.rules
  egrep -q "^\s*-w\s+/sbin/rmmod\s+-p\s+x\s+-k\s+modules\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /sbin/rmmod -p x -k modules" >> /etc/audit/audit.rules
  egrep -q "^\s*-w\s+/sbin/modprobe\s+-p\s+x\s+-k\s+modules\s*(#.*)?$" /etc/audit/audit.rules || echo "-w /sbin/modprobe -p x -k modules" >> /etc/audit/audit.rules
  uname -p | grep -q 'x86_64' && egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b64\s+-S\s+init_module\s+-S\s+delete_module\s+-k\s+modules\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b64 -S init_module -S delete_module -k modules" >> /etc/audit/audit.rules
  uname -p | grep -q 'x86_64' || (egrep -q "^\s*-a\s+always,exit\s+-F\s+arch=b32\s+-S\s+init_module\s+-S\s+delete_module\s+-k\s+modules\s*(#.*)?$" /etc/audit/audit.rules || echo "-a always,exit -F arch=b32 -S init_module -S delete_module -k modules" >> /etc/audit/audit.rules)

  # Make the Audit Configuration Immutable
  echo
  echo \*\*\*\* Make\ the\ Audit\ Configuration\ Immutable
  sed -r '/^\s*(#.*)?$/ d' /etc/audit/audit.rules | tail -n 1 | egrep -q "^\s*-e 2\s*(#.*)?$" || (sed '/^\s*-e 2\s*(#.*)?$/ d' /etc/audit/audit.rules && echo "-e 2" >> /etc/audit/audit.rules)

  # Install AIDE
  echo
  echo \*\*\*\* Installing\ AIDE
  dpkg -s aide || apt-get -y install aide

  # Implement Periodic Execution of File Integrity
  echo
  echo \*\*\*\* Implement\ Periodic\ Execution\ of\ File\ Integrity
  (crontab -u root -l; crontab -u root -l | egrep -q "^0 5 \* \* \* /usr/sbin/aide --check$" || echo "0 5 * * * /usr/sbin/aide --check" ) | crontab -u root -
fi
