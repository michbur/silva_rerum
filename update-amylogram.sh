sudo stop shiny-server
sudo su shiny
R
source("https://install-github.me/michbur/AmyloGram")
echo "cat(system.file(package = 'AmyloGram'), '/AmyloGram\n', sep = '')" | R --no-save > tmp_file
rm -rf /srv/shiny-server/AmyloGram
sudo cp -R `tail -2 tmp_file | head -1` /srv/shiny-server/AmyloGram
sudo start shiny-server
