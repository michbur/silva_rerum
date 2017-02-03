su shiny

R -e "devtools::install_github('michbur/dpcR')"
echo "cat(system.file(package = 'dpcR'), '/dpcReport\n', sep = '')" | R --no-save > tmp_file
cp -R `tail -2 tmp_file | head -1` /srv/shiny-server/dpcReport

R -e "devtools::install_github('michbur/AmyloGram')"
echo "cat(system.file(package = 'AmyloGram'), '/AmyloGram\n', sep = '')" | R --no-save > tmp_file
cp -R `tail -2 tmp_file | head -1` /srv/shiny-server/AmyloGram
