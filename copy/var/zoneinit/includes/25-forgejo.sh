# Initial create configuration file if it does not exists already.
HOSTNAME=$(hostname)
FORGEJO_INI=/opt/local/etc/forgejo/conf/app.ini
FORGEJO_HOME=/var/db/forgejo

# The configuration file is only used for Initial setup. The web-ui setup will
# complete the installation.
if [ ! -f "${FORGEJO_INI}" ]; then
	cat >${FORGEJO_INI} <<-EOF
		RUN_USER = git
		WORK_PATH = /opt/local/share/forgejo
		  
		[server]
		APP_DATA_PATH = ${FORGEJO_HOME}/data
		SSH_DOMAIN = ${HOSTNAME}
		DOMAIN = ${HOSTNAME}
		ROOT_URL = https://${HOSTNAME}
		OFFLINE_MODE = true
		HTTP_ADDR = 127.0.0.1

		[database]
		DB_TYPE = sqlite3

		[log]
		ROOT_PATH = /var/log/forgejo

		[repository]
		DEFAULT_PRIVATE = private

		[openid]
		ENABLE_OPENID_SIGNIN = false
		ENABLE_OPENID_SIGNUP = false

		[service]
		REGISTER_EMAIL_CONFIRM = true
		REGISTER_MANUAL_CONFIRM = true
		ENABLE_NOTIFY_MAIL = true
		ENABLE_CAPTCHA = true

		[mailer]
		ENABLED = true
		PROTOCOL = sendmail
		FROM = git@${HOSTNAME}
	EOF
fi

# Enable environment configuration for users
mkdir -p ${FORGEJO_HOME}/.ssh
echo 'PATH=/usr/local/sbin:/usr/local/bin:/opt/local/sbin:/opt/local/bin:/usr/sbin:/usr/bin:/sbin' \
	>${FORGEJO_HOME}/.ssh/environment
gsed -i -e 's:.*PermitUserEnvironment.*no:PermitUserEnvironment yes:g' \
	/etc/ssh/sshd_config

# Fix all required permissions
chown -R git:git \
	${FORGEJO_HOME}/.ssh \
	${FORGEJO_INI} \
	/var/log/forgejo

# Enable gogs service
svcadm enable svc:/pkgsrc/forgejo:default
