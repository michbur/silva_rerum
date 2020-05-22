#cat /etc/*-release
sudo sh -c 'echo "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/" >> /etc/apt/sources.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo apt-get update
sudo apt-get install r-base
sudo apt-get install gdebi-core
sudo apt-get install libxml2-dev
sudo apt-get install libx11-dev 
sudo apt-get install mesa-common-dev
sudo apt-get install libglu1-mesa-dev
sudo apt-get install libssl-dev
sudo apt-get install libgmp3-dev
sudo su - \
-c "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""
wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.13.944-amd64.deb
sudo gdebi shiny-server-1.5.13.944-amd64.deb
sudo su shiny
# sudo su - -c "R -e \"install.packages('shiny')\""
# sudo su - -c "R -e \"install.packages('devtools')\""
# sudo su - -c "R -e \"install.packages('rmarkdown')\""
# sudo su - -c "R -e \"install.packages('AmyloGram')\""
echo "cat(system.file(package = 'AmyloGram'), '/AmyloGram\n', sep = '')" | R --no-save > tmp_file
sudo cp -R `tail -2 tmp_file | head -1` /srv/shiny-server/AmyloGram
rm tmp_file
