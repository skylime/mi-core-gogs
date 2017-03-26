# This script will try to manage the ssl certificates for us. It will
# use the mdata variable if provided, if it does not exists we will
# try to get a certificate from the Let's Encrypt API.
# As fallback the self-signed certificate is used from 45-ssl-selfsigned.sh

# Default
SSL_HOME='/opt/local/etc/nginx/ssl/'

# Create folder if it doesn't exists
mkdir -p "${SSL_HOME}"

# Use user certificate if provided
if mdata-get nginx_ssl 1>/dev/null 2>&1; then
	(
	umask 0077
	mdata-get nginx_ssl > "${SSL_HOME}/nginx.pem"
	# Split files for nginx usage
	openssl pkey -in "${SSL_HOME}/nginx.pem" -out "${SSL_HOME}/nginx.key"
	openssl crl2pkcs7 -nocrl -certfile "${SSL_HOME}/nginx.pem" | \
		openssl pkcs7 -print_certs -out "${SSL_HOME}/nginx.crt"
	)
elif /opt/core/bin/ssl-letsencrypt.sh -t webroot 1>/dev/null; then
	# Try to generate let's encrypt ssl certificate for the hostname
	LE_HOME='/opt/local/etc/letsencrypt/'
	LE_LIVE="${LE_HOME}live/$(hostname)/"
	# Workaround to link correct files for SSL_HOME
	ln -sf ${LE_LIVE}/fullchain.pem ${SSL_HOME}/nginx.crt
	ln -sf ${LE_LIVE}/privkey.pem ${SSL_HOME}/nginx.key
	# Update renew-hook.sh
	echo '#!/usr/bin/env bash' > ${LE_HOME}renew-hook.sh
	echo 'svcadm restart svc:/pkgsrc/nginx:default' >> ${LE_HOME}renew-hook.sh
fi

# Always run a restart of the webserver
svcadm restart svc:/pkgsrc/nginx:default
