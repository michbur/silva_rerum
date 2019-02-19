sudo su - -c "R -e \"source('https://install-github.me/michbur/HaDeX')\""
echo "cat(system.file(package = 'HaDeX'), '/HaDeX\n', sep = '')" | R --no-save > tmp_file
sudo rm -rf /srv/shiny-server/HaDeX
sudo cp -R `tail -2 tmp_file | head -1` /srv/shiny-server/HaDeX
# sudo systemctl restart shiny-server