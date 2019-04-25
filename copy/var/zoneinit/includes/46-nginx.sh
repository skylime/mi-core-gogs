# Enable nginx service
svcadm enable svc:/pkgsrc/nginx:default

# Configure SSL
/opt/core/bin/ssl-generate.sh /opt/local/etc/nginx/ssl nginx_ssl nginx svc:/pkgsrc/nginx:default

# Restart nginx to support new SSL certificate
svcadm restart svc:/pkgsrc/nginx:default
