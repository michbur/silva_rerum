sudo stop shiny-server
sudo su shiny
cd /home/shiny
echo "devtools::install_github('/michbur/AmpGram', dependencies = TRUE)" | R --no-save
echo "source('https://install-github.me/michbur/AmpGramModel')" | R --no-save
echo "cat(system.file(package = 'AmpGram'), '/AmpGram\n', sep = '')" | R --no-save > tmp_file
exit
sudo cp -R `tail -2 /home/shiny/tmp_file | head -1` /srv/shiny-server/AmpGram
sudo start shiny-server
