?dbino

dbinom(x=2,size=6,prob = 0.7)

ppois(16,lambda = 12)

ppois(17,lambda = 12,lower=F)

ppois(1,lambda = 1)

ppois(1,lambda = 1)

pnorm(84,mean = 72,sd=15.2,lower.tail = F)

dnorm(84,mean = 72,sd=15.2)

#lamba=6
#first 2 min me call uthane ki probality
ppois(2,lambda = 6, lower.tail = T)

#----------------Anova is extension of T-test-------------------------------

#T test is used to compare diffrence between 2 means

#Anova is used to compare mean between more than 2 test(Ttest can only find between 2)

#if t test is applied to individualyn selecting 2. each t test will have type 1 error of 5%

#on combining all type 1 error will be more than 5%

#bt in anova we will get les than equal to 5% error

#family wise error or experimental wise error which occus on severel t test
pain=c(4,5,4,3,2,4,3,4,4,6,8,4,5,4,
       6,5,8,6,6,7,6,6,7,5,6,5,5)
drug=c(rep("A",9),rep("B",9),rep("C",9))
migraine=data.frame(pain,drug)

#gl(3,9,27 lables=c("A","B","C"))

attach(migraine)
by(pain,factor(drug),mean)
by(pain,factor(drug),sd)
by(pain,factor(drug),var)
mean(pain)

#mean(pain) = grand mean
#sd(pain)= grand pain
#var(pain)= grand var


plot(pain~ drug,data=migraine)

result<-aov(pain~drug,data = migraine)
summary(result)
summary.lm(result)#diffrence btween group means

#increase type 1 error
pairwise.t.test(pain,drug,p.adjust="bonferroni")

#decreases type 2 error
TukeyHSD(result,conf.level = 0.95)

#TwoWay Anova
googglesData<-read.csv(file.choose(),header = T)
head(googglesData)
str(googglesData)

googglesData$alcohol<-factor(googglesData$alcohol,levels=c("None","2 Pints","4 Pints"))

by(googglesData$attractiveness,googglesData$gender,mean)

by(googglesData$attractiveness,googglesData$alcohol,mean)

googleModel<-aov(attractiveness ~ alcohol*gender,data=googglesData)

summary.lm(googleModel)







