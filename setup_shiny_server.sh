sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
sudo apt-get update
sudo apt-get install r-base
sudo apt-get install r-base-dev
sudo apt-get install gdebi-core
sudo apt-get install libxml2-dev
sudo apt-get install libx11-dev 
sudo apt-get install mesa-common-dev
sudo apt-get install libglu1-mesa-dev
wget http://download2.rstudio.org/rstudio-server-0.97.336-amd64.deb
wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.4.0.756-amd64.deb
sudo gdebi shiny-server-1.4.0.756-amd64.deb
sudo su shiny
# sudo su - -c "R -e \"install.packages('shiny')\""
# sudo su - -c "R -e \"install.packages('devtools')\""
# sudo su - -c "R -e \"install.packages('rmarkdown')\""
# sudo su - -c "R -e \"devtools::install_github('michbur/dpcR')\""
echo "cat(system.file(package = 'dpcR'), '/dpcReport\n', sep = '')" | R --no-save > tmp_file
sudo cp -R `tail -2 tmp_file | head -1` /srv/shiny-server/shiny-server
rm tmp_file
#address http://123.456.1.2:3838/
