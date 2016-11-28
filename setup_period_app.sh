cd /srv/shiny-server/
git clone https://github.com/michbur/period.git period_app
sudo su shiny
sudo su - -c "R -e \"install.packages(c('qpcR', 'lmtest', 'lawstat', 'gplots'))\"
# check http://www.smorfland.uni.wroc.pl/shiny/AmyloGram/
