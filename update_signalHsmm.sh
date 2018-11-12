sudo su - -c "R -e \"install.packages(c('shinythemes', 'rmarkdown'))\""
sudo su - -c "R -e \"source('https://install-github.me/michbur/signalHsmm')\""
echo "cat(system.file(package = 'signalHsmm'), '/signal_gui\n', sep = '')" | R --no-save > tmp_file
sudo cp -R `tail -2 tmp_file | head -1` /srv/shiny-server/signalHsmm
