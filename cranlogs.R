library(cranlogs)

down_dpcR <- cran_downloads(package = "dpcR", from = "2013-01-01", to = "2016-01-06")
sum(down_dpcR[["count"]])

sapply(c("dpcR", "chipPCR", "biogram"), function(i)
  sum(cran_downloads(package = i, from = "2013-01-01", to = "2016-01-06")[["count"]])
)


start <- as.Date('2013-09-09')
today <- as.Date('2016-06-01')

all_days <- seq(start, today, by = 'day')

year <- as.POSIXlt(all_days)$year + 1900
urls <- paste0('http://cran-logs.rstudio.com/', year, '/', all_days, '.csv.gz')

# only download the files you don't have:
missing_days <- setdiff(as.character(all_days), tools::file_path_sans_ext(dir("CRANlogs"), TRUE))

dir.create("CRANlogs")
for (i in 1:length(missing_days)) {
  print(paste0(i, "/", length(missing_days)))
  download.file(urls[i], paste0('CRANlogs/', missing_days[i], '.csv.gz'))
}


file_list <- list.files("CRANlogs", full.names=TRUE)

logs <- list()
for (file in file_list) {
  print(paste("Reading", file, "..."))
  logs[[file]] <- read.table(file, header = TRUE, sep = ",", quote = "\"",
                             dec = ".", fill = TRUE, comment.char = "", as.is=TRUE)
}

# rbind together all files
library(data.table)
dat <- rbindlist(logs)