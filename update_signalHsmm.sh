sudo stop shiny-server
sudo su shiny
R
install.packages(c("rmarkdown", "devtools", "shiny", "DT"))
library(devtools)
install_github("michbur/signalHsmm")
echo "cat(system.file(package = 'signalHsmm'), '/signal_gui\n', sep = '')" | R --no-save > tmp_file
sudo cp -R `tail -2 tmp_file | head -1` /srv/shiny-server/signalHsmm
sudo start shiny-server
#address http://smorfland.uni.wroc.pl:3838/signalHsmm

# change server file
sudo wget -O /srv/shiny-server/signalHsmm/server.R "http://raw.githubusercontent.com/michbur/signalHsmm/master/inst/signal_gui/server.R"
