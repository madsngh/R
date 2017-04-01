#R day 3 class
exameDate<-read.csv(file.choose(),header=T)
head(exameDate)

#----Make Numeric-----

exameNumeric<-exameDate[,c(2:4)]
head(exameDate)
head(exameNumeric)
cor(exameNumeric,use="everything", method="person")

#for converting in percentage

cor(exameNumeric)^2*100

#Non Parametric corelation
liarData<-read.csv(file.choose(),header=T)
head(liarData)
cor(liarData$Position,liarData$Creativity,use = "complete.obs",method = "spearman")

cor(liarData$Creativity,liarData$Position,use="everything",method = "kendall")

cor.test(liarData$Creativity,liarData$Position,use="everything",method = "kendall")
library(ggm)

partial<-pcor(c("Anxiety","Exam","Revise"),var(exameDate))
partial^2*100
partial<-pcor(c("Revise","Exam","Anxiety"),var(exameDate))^2*100
partial<-pcor(c("Anxiety","Revise","Exam"),var(exameDate))^2*100
#--chi--
library(gmodels)
cats<-read.csv(file.choose())
head(cats)
CrossTable(cats$Training,cats$Dance,fisher=T,chisq=T,expected = T,sresid = T,format = T)
CrossTable(cats$Training,cats$Dance,fisher = T,chisq = T,expected = T,sresid = T,format = "SPSS")

# linear regression
#-------single dependent variable-------------------

Album2=read.delim(file.choose(),header = T)

head(Album2)
AlbumSReg<-lm(sales~ adverts,data=Album2,na.action = na.omit)

summary(AlbumSReg)

corealtion<-cor(Album2$adverts,Album2$sales)
corealtion^2

#-------multiple regression model--------------------


AlbumMReg<-lm(sales~ adverts+airplay+attract,data=Album2,na.action = na.omit)#hierrarical
summary(AlbumMReg)

#Standerd beta values sbko ek unit me lane k liye
library(QuantPsyc)
library(psych)
library(pastecs)

lm.beta(AlbumMReg)
round(stat.desc(Album2,basic=F,norm=T),digits = 3)
#--------------Multiple Regression C.I.-----------------
confint(AlbumMReg) #configence interval

anova(AlbumSReg,AlbumMReg)

AlbumMReg

AlbumSReg

#dalwinWatsonTest

dwt(AlbumMReg)


#VifTest
vif(AlbumMReg)


library(sas7bdat)
walmart<-read.sas7bdat(file.choose())
head(walmart)

View(walmart)
dim(walmart)
set.seed(25)#setting the random seed for splitting the set 
#jisse firse sample kare aur same seed set kare humme same value mille
ranuni<-sample(x=c("Training","Testing"),size = nrow(walmart),replace = T,prob=c(0.7,0.3))
#cbind

TrainingData<-walmart[ranuni=="Training",]
TestingData<-walmart[ranuni=="Testing",]
View(TrainingData)
View(walmart)
TrainingModel=lm(Employee_Performance~.,data=TrainingData)
TrainingModel1=lm(Employee_Performance~.,data=TrainingData[,-14])
summary(TrainingModel)
library(car)
vif(TrainingModel)
vif(TrainingModel1)
summary(TrainingModel1)
TrainingMode2<-step(object=TrainingModel,direction = "backward")
summary(TrainingMode2)
vif(TrainingMode2)
dwt(TrainingMode2)

qqnorm(TrainingModel$residuals) ##qqploat
qqline(TrainingModel1$residuals)


shapiro.test(TrainingMode2$residuals)
residuals<-resid(TrainingModel)#getting residual
plot(TrainingData$Employee_Performance,y=residuals)

TestPred<-predict.lm(object=TrainingMode2,newdata = TestingData) #ycap
TestPred
cor(x=TrainingMode2$fitted.values,y=TrainingData$Employee_Performance)
plot(x=TrainingData$Employee_Performance,y=TrainingMode2$fitted.values,type="p",col="red")

cor(x=TestPred,y=TestingData$Employee_Performance)
