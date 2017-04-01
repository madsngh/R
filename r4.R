library(sas7bdat)
iq<-read.sas7bdat(file.choose())
View(iq)
shapiro.test(x=iq$IQ_Level)
t.test(iq$IQ_Level,Mu=50)

#two independent sample t test
twosample<- read.sas7bdat(file.choose())


library(car)
leveneTest(twosample$IQ_Level,
           group=twosample$Gender)


sample1<-twosample[twosample$Gender=='F',2]
sample2<-twosample[twosample$Gender=='M',2]




t.test(sample1,sample2,var.equal = T)

#Paired Sample t Test
pair<- read.sas7bdat(file.choose())
change<-(pair$Before_The__Test -pair$After_The_Test)
change
shapiro.test(change)
t.test(x=pair$Before_The__Test, y=pair$After_The_Test, paired = T)