sudo apt-get -y install nginx
sudo nano /etc/nginx/sites-enabled/default

# location /shiny/ {
#                proxy_pass http://localhost:3838/;
#                proxy_redirect http://localhost:3838/ $scheme://$host/;
#        }

sudo service nginx restart
