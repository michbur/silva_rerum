sudo R -e "devtools::install_github('michbur/dpcR')"
echo "cat(system.file(package = 'dpcR'), '/dpcReport\n', sep = '')" | R --no-save > tmp_file
sudo cp -R `tail -2 tmp_file | head -1` /srv/shiny-server/dpcReport

#address http://smorfland.uni.wroc.pl/shiny/dpcReport
