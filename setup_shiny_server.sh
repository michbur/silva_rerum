#add deb https://cran.rstudio.com/bin/linux/ubuntu trusty/ to /etc/apt/sources.list

sudo apt-get update
sudo apt-get install r-base
sudo apt-get install r-base-dev
sudo apt-get install gdebi-core
sudo gdebi shiny-server-1.4.0.deb
sudo su - -c "R -e \"install.packages('shiny')\""
sudo su - -c "R -e \"install.packages('devtools')\""
sudo su - -c "R -e \"install.packages('rmarkdown')\""
sudo su - -c "R -e \"devtools::install_github('michbur/dpcR')\""
echo "cat(system.file(package = 'dpcR'), '/dpcReport\n', sep = '')" | R --no-save > tmp_file
tail -2 tmp_file | head -1 | cp shiny-server
cp -R `tail -2 tmp_file | head -1` /srv/shiny-server/shiny-server
rm tmp_file
