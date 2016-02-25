sudo su shiny
R
install.packages(c("rmarkdown", "devtools", "shiny", "DT"))
library(devtools)
install_github("michbur/signalHsmm")
echo "cat(system.file(package = 'signalHsmm'), '/signal_gui\n', sep = '')" | R --no-save > tmp_file
sudo cp -R `tail -2 tmp_file | head -1` /srv/shiny-server/signalHsmm
