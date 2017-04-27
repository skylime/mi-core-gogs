# Paste default environment file
echo "PATH=/usr/local/sbin:/usr/local/bin:/opt/local/sbin:/opt/local/bin:/usr/sbin:/usr/bin:/sbin" > \
	/opt/gogs/.ssh/environment

# Enable gogs service
svcadm enable svc:/application/gogs:default
