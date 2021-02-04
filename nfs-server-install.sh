#!/bin/bash

## CentOS7
yum update -y
yum install nfs-utils -y
mkdir /var/nfsshare
chmod -R 755 /var/nfsshare
chown nfsnobody:nfsnobody /var/nfsshare

systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap

echo '' > /etc/exports
cat <<EOF > /etc/exports
/var/nfsshare    *(rw,sync,no_root_squash,no_all_squash)
EOF

systemctl restart nfs-server
firewall-cmd --permanent --zone=public --add-service=nfs
firewall-cmd --permanent --zone=public --add-service=mountd
firewall-cmd --permanent --zone=public --add-service=rpc-bind
firewall-cmd --reload
