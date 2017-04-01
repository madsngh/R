LungCap<-read.table(file.choose(),header=T)
head(LungCap)
plot(LungCap$Age,LungCap$Height)
plot(LungCap$Age,LungCap$Height,main = "Scatterplot for Age and Height",
     cex=1.2,pch=3,col=3)
    #cex size of point 
    #pch point character
    #col color
#ploat for graph 2gethet
par(mfrow=c(2,2))
#2,2 space means 4 ploats in a single window

plot(LungCap$Age[LungCap$Gender=="male"],LungCap$Height[LungCap$Gender=="male"],
     xlab="AGE",ylab="Height",main="Height Vs Age for male")

plot(LungCap$Age[LungCap$Gender=="female"],LungCap$Height[LungCap$Gender=="female"],
     xlab="AGE",ylab="Height",main="Height Vs Age for female",xlim=c(0,20),ylim = c(45,80))

plot(LungCap$Age[LungCap$Gender=="female"],LungCap$LungCap[LungCap$Gender=="female"],
     xlab="AGE",ylab="LungCap",main="LungCap Vs Age for female")

plot(LungCap$Age[LungCap$Gender=="male"],LungCap$LungCap[LungCap$Gender=="male"],
     xlab="AGE",ylab="Height",main="Lungcap Vs Age for male")
#off 4 ploats
dev.off()

library(psych)

head(mtcars)
#by default dataset of R
data()
pairs.panels(mtcars[,1:5])
dim(diamonds)

library(ggplot2)
set.seed(2)
dsmall<-diamonds[sample(nrow(diamonds),100),]
dsmall2<-diamonds[sample(nrow(diamonds),100),]



names(dsmall)
qplot(carat,price,data=dsmall,colour=color,size=I(1.2))#I is use to make size written on graph invisiable
qplot(carat,price,data=dsmall,shape=cut)
qplot(color,price/carat,data=dsmall,geom="boxplot")
qplot(color,price/carat,data=diamonds,geom="jitter",alpha=I(0.8),colour=color)
qplot(color,data=dsmall,geom="density",colour=color)
qplot(carat,data=dsmall,geom="histogram",fill=color)

ggplot(data = dsmall,aes(x=cut,y=price,fill=cut))+geom_bar(stat="identity")
############
library(lattice)

head(mtcars)
xyplot(mpg~wt|factor(cyl),data = mtcars,pch=19,
       main="mpg Vs wt",
       xlab="wt/1000",
       ylab="mpg",layout=c(3,1))

#here 3 coloum 1 row

cloud(mpg~wt*qsec|factor(cyl),main="3D Scatters",data=mtcars)

dotplot(factor(cyl)~mpg|factor(gear),main="dotplot plot by gear and cly",
        xlab="miles per gallon",
        layout=c(3,1),data=mtcars)

splom(mtcars[c(1,3,4,5,6)],main="mtcars data")
partial<-pcor(c("Anxiety","Exam","Revise"),var(exameData))