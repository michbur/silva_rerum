#add deb https://cran.rstudio.com/bin/linux/ubuntu trusty/ to /etc/apt/sources.list

sudo apt-get update
sudo apt-get install r-base
sudo apt-get install r-base-dev
sudo apt-get install gdebi-core
sudo gdebi shiny-server-1.4.0.deb
sudo su - -c "R -e \"install.packages('shiny')\""
