#version=RHEL7

auth --enableshadow --passalgo=sha512
cdrom
skipx
cmdline
text
keyboard --vckeymap=gb --xlayouts='gb'
lang en_UK.UTF-8
selinux --disable
firewall --disable

# Network information for VM ware nic
network  --bootproto=dhcp --device=eno16777736 --ipv6=auto --activate
network  --hostname=localhost.localdomain

rootpw --iscrypted $6$9YiXO2N5dUKyQW9b$HpvyRNJ5XxKVmLzVR7VwNz38b0expBQRPOti7jIXKIQP97Jad4g53bE19ewYAzk87AhvxAoBcbk4LvUSVJC7u0
timezone Europe/London --isUtc --nontp
user --groups=wheel --name=kmcnally --password=$6$GooWvGNeXYYl3ydX$leFEJaXedBhZjOJBz53FMN622B2I3ECLZ0PuPo4QlQ5rvik7dMIeA7hvsMjKk1Kvj3qbgKcTvlbHJYdPzbWPo. --iscrypted

ignoredisk --only-use=sda
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda
autopart --type=lvm
clearpart --none --initlabel

%packages
@core
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end
