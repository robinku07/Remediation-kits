This archive contains a shell script for configuring Debian Linux 8 according to the CIS Benchmark.  It was tested against the CIS Debian Linux 8 Benchmark v1.0.0 as assessed by CIS-CAT v3.0.21.

To execute the script pass a single parameter for the profile desired:

# sh CIS_Debian_Linux_8_Benchmark_v1.0.0.sh "Level 1"

or 

# sh CIS_Debian_Linux_8_Benchmark_v1.0.0.sh "Level 2"

If no parameter is passed the script will default to "Level 1".



In addition to non cis-cat assessed items, the following are not configured by this script:

2.1, 2.5, 2.6, 2.7, 2.8, 2.9: Partioning is not modified, mount options will be set if partition exists.

3.3: Bootloader password must be set by end user.

3.4: Root user password must be set by end user.

4.5: May require manual remediation.

6.5: NTP server must be set by end user.

6.15: Remediation depends on MTA in use.

8.2.4: Automated parsing of rsyslog.conf can falsely identify non-logfiles for remediation, should be completed manually.

8.2.5: Remote log server must be set by end user.

9.3.13: SSH Access limits must be set by end user.

12.8, 12.9: Apropriate user/group must be set by end user.

13.1: Appropriate password must be set by end user.

13.5: Proper UID 0 account may have been remnamed, should be completed manually.

13.6: root PATH must be set by end user.

13.7, 13.8, 13.9, 13.10: User file/folder permissions/existence should be updated manually.

13.11: Groups should be deleted from passwd or added to /etc/group by end user.

13.12: Proper home directories must be assigned by end user.

13.13: Directory ownership should be updated manually.

13.14, 13.15: Duplicate IDs must be remediated by end user.

13.16, 13.17: Duplicate names must be remediated by end user.

13.18, 13.19: User file/folder permissions/existence should be updated manually.

13.20: User groups should be updated manually