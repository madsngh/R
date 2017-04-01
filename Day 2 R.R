getwd()
setwd("D:/R datasets")

#Importing Data in R 
getwd()
setwd("C:/Users/madsngh/Desktop/R/R datasets")
df <- read.table ("credit_card_expo.txt", header = T)
head(df)

?read.table()

#DATA IMPORT
MyBook <- read.table(file.choose(), header = TRUE)

MyBook <- read.table("D:/R datasets/credit_card_expo.txt",
                    header=TRUE)

#MyBook <- read.delim("credit_card_expo.txt", header= TRUE)

head(MyBook)

View(MyBook)

ab <- edit(MyBook)
head(ab)

##read csv file
Mycsv <- read.csv("world_sales_expo.csv",header=TRUE)

head(Mycsv)

library(sas7bdat)

mySas <- read.sas7bdat(file="world_report.sas7bdat")
head(mySas) 
dim(mySas)
#str(mySas)

#To read an Excel file, we need two libraries.
library(xlsx)

xlfile <- read.xlsx("World_sales.xls", sheetIndex="Passengers")
head(xlfile)
str(xlfile)

myfwffile <- read.fwf("file.txt",width=c(2,4,1,1,3))
myfwffile

colnames(myfwffile) <- LETTERS[1:5]
head(myfwffile)

dt1 <- read.table("dt1.txt",sep="/", quote="\"'", 
                  stringsAsFactors = F) # need to check
head(dt1)

str(dt1)

dt1[which(dt1$V5=="EMPTY"), "V5" ] <- NA
head(dt1)


dt1 <- read.table("dt1.txt",sep="/",quote = "\"'",
               na.strings = c("EMPTY","Empt"),
               col.names = c("a","b","c","d","e"),
               stringsAsFactors = F) #reading of quota and provide NA to null value
head(dt1)
#dt1[which(dt1$e == " BEST"),] <- "abc"
 

dt1 <- read.table("dt1.txt",sep="/",quote = "\"'",
               na.strings = "EMPTY",
               col.names = c("a","b","c","d","e"),
               nrows =3) #show row 3
head(dt1)

dt1 <- read.table("dt1.txt",sep="/",quote = "\"'",
               na.strings = "EMPTY",
               col.names = c("a","b","c","d","e"),
               skip=2) #show skip 2
head(dt1)

dt2<-read.table("dt2.txt",sep=";", dec=".") #replacing comma to Decimals
head(dt2)

dt3 <- read.csv("dt3.txt",header=T,
                col.names = c("a","b","c","d","e"))
dt3

ab <- c(rep("integer", 2), "character","NULL","character")

dt4 <- read.csv("dt4.txt",header=T, colClasses = ab)
dt4
str(dt4)

## Exporting data
write.table(dt2,"dt2new.txt")
write.csv (dt2,"dtnew.csv", row.names = F)

##rdata (binary)
mybook <- read.table("credit_card_expo.txt",
                     header= TRUE,
                     stringsAsFactors = F)
head(mybook)

save(mybook, file = "mybook.rdata")
rm(mybook)

load("mybook.rdata")
head(mybook)

# multiple data store

n <- 20:30
r <- 40:50
w <- data.frame(n, r)

save(n,r,w,file="multiple.rdata")

rm(n,r,w)

load("multiple.rdata")
n
r
w

#####----
library(xlsx)
xfile <- read.xlsx("World_sales.xls",sheetName  = "World_Dates")
head(xfile)

write.xlsx(xfile,"World_salesnew.xls")


library(foreign)
spss1  <- read.spss('Class.sav',to.data.frame=T,use.value.labels = T)
head(spss1)

# write.foreign(spss1,'Classnew.sav',codefile = "Classnew.sps",package = "SPSS")
# spss2 <- read.spss("Classnew.sps")
# head(spss2)

