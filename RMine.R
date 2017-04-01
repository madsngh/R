getwd()
setwd("C:/Users/madsngh/Desktop/R/R_datasets")
getwd()
library(xlsx)
read.xlsx(file.choose(),header=T)
read.xlsx("World_sales.xls", sheetIndex="Passengers")
myfwffile <- read.fwf("file.txt",width=c(2,4,1,1,3))
getwd()
setwd("C:/Users/madsngh/Desktop/R/R datasets")
myfwffile <- read.fwf("file.txt",width=c(2,4,1,1,3))
getwd()
setwd("C:/Users/madsngh/Desktop/R/R datasets/")
getwd()
myfwffile <- read.fwf("file.txt",width=c(2,4,1,1,3))
myfwffile
rm(myfwffile)
myfwffile <- read.fwf("file.txt",width=c(2,4,1,1,3))
myfwffile
colnames(myfwffile)<-LETTERS[1:5]
myfwffile

dt1 <- read.table("dt1.txt",sep="/", quote="/"'",stringsAsFactors = F)
dt1 <- read.table("dt1.txt",sep="/", quote="\"'", 
                  stringsAsFactors = F)
getwd()
setwd("C:/Users/madsngh/Desktop/R/R datasets/")
dt1 <- read.table("dt1.txt",sep="/", quote="\"'", 
                  stringsAsFactors = F)

dt1
?help(read.table)


