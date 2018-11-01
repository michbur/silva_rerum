sudo su - -c "R -e \"source('https://install-github.me/michbur/reverseR')\""
echo "cat(system.file(package = 'reverseR'), '/reverseR\n', sep = '')" | R --no-save > tmp_file
sudo cp -R `tail -2 tmp_file | head -1` /srv/shiny-server/reverseR
# sudo systemctl restart shiny-server
