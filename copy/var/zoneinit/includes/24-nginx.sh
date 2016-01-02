# Enable nginx and configure ssl support

host=$(mdata-get sdc:hostname)
cert_dir='/opt/local/etc/nginx/ssl/'

# Configure nginx ssl certificate and authentication
if mdata-get nginx_ssl 1>/dev/null 2>&1; then
	mdata-get nginx_ssl > ${cert_dir}nginx.pem
else
	openssl req -newkey rsa:2048 -keyout ${cert_dir}nginx.key \
				-out ${cert_dir}nginx.csr -nodes \
				-subj "/C=DE/L=Raindbow City/O=Aperture Science/OU=Please use valid ssl certificate/CN=${host}"
	openssl x509 -in ${cert_dir}nginx.csr -out ${cert_dir}nginx.crt -req -signkey ${cert_dir}nginx.key -days 128
	cat ${cert_dir}nginx.crt ${cert_dir}nginx.key > ${cert_dir}nginx.pem
fi
chmod 400 ${cert_dir}nginx.pem

# Enable nginx service
svcadm enable svc:/pkgsrc/nginx:default
