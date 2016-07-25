a2enmod ssl
a2ensite default-ssl
service apache2 reload

# configuration file
# <IfModule mod_ssl.c>
# <VirtualHost _default_:443>
#         ServerName YourServerName # nazwa domeny
#         ServerAdmin webmaster@localhost
#         DocumentRoot /var/www
#         <Directory />
#                 Options FollowSymLinks
#                 AllowOverride None
#         </Directory>
#         <Directory /var/www/>
#                 Options Indexes FollowSymLinks
#                 AllowOverride None
#                 Order allow,deny
#                 allow from all
#         </Directory>
#         ErrorLog ${APACHE_LOG_DIR}/error.log
#         LogLevel warn
#         CustomLog ${APACHE_LOG_DIR}/ssl_access.log combined
#         SSLEngine on
#         SSLCertificateFile    /etc/ssl/certs/ssl-cert-snakeoil.pem
#         SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
#         <FilesMatch "\.(cgi|shtml|phtml|php)$">
#                 SSLOptions +StdEnvVars
#         </FilesMatch>
#         <Directory /usr/lib/cgi-bin>
#                 SSLOptions +StdEnvVars
#         </Directory>
#         BrowserMatch "MSIE [2-6]" \
#                 nokeepalive ssl-unclean-shutdown \
#                 downgrade-1.0 force-response-1.0
#         BrowserMatch "MSIE [17-9]" ssl-unclean-shutdown
#         <Directory /var/www/owncloud>
#                 Options Indexes FollowSymLinks
#                 AllowOverride All
#                 Allow from all
#                 Require all granted
#                 Dav Off
#                 Satisfy Any
#         </Directory>
# </VirtualHost>
# </IfModule>

a2enmod rewrite
service apache2 restart