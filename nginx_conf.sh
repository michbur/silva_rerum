sudo apt-get -y install nginx
sudo nano /etc/nginx/sites-enabled/default

# location /shiny/ {
#                proxy_pass http://localhost:3838/;
#                proxy_redirect http://localhost:3838/ $scheme://$host/;
#        }

sudo service nginx restart

sudo stop shiny-server
sudo su shiny
R

library(devtools)
install_github("michbur/AmyloGram")

echo "cat(system.file(package = 'AmyloGram'), '/AmyloGram\n', sep = '')" | R --no-save > tmp_file
sudo cp -R `tail -2 tmp_file | head -1` /srv/shiny-server/AmyloGram
