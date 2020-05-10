sudo stop shiny-server
sudo su shiny
echo "source('https://install-github.me/michbur/AmpGram')" | R --no-save
echo "source('https://install-github.me/michbur/AmpGramModel')" | R --no-save
echo "cat(system.file(package = 'AmpGram'), '/AmpGram\n', sep = '')" | R --no-save > tmp_file
exit
sudo cp -R `tail -2 tmp_file | head -1` /srv/shiny-server/AmpGram
sudo start shiny-server
