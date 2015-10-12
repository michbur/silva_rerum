#cool gs script converting colour pots to grayscale
#!/bin/bash
gs -sDEVICE=pdfwrite -dProcessColorModel=/DeviceGray -dColorConversionStrategy=/Gray -dPDFUseOldCMS=false -o $1_bw.pdf -f $1.pdf
