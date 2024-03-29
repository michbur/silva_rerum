#cat /etc/*-release
sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
sudo apt-get update
sudo apt-get install r-base
sudo apt-get install gdebi-core
sudo apt-get install gdebi-core cmake libxml2-dev libcurl4-openssl-dev libx11-dev mesa-common-dev libglu1-mesa-dev libssl-dev libgmp3-dev zlib1g-dev libjpeg-dev libpng-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev
sudo su - \
-c "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""
wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.17.973-amd64.deb
sudo gdebi shiny-server-1.5.17.973-amd64.deb
sudo su shiny
# sudo su - -c "R -e \"install.packages('shiny')\""
# sudo su - -c "R -e \"install.packages('devtools')\""
# sudo su - -c "R -e \"install.packages('rmarkdown')\""
# sudo su - -c "R -e \"install.packages('AmyloGram')\""
echo "cat(system.file(package = 'AmyloGram'), '/AmyloGram\n', sep = '')" | R --no-save > tmp_file
sudo cp -R `tail -2 tmp_file | head -1` /srv/shiny-server/AmyloGram
rm tmp_file
