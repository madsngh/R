a<-c(38,47,39,25,42,22,19,8,23,31,14,26,11,18,5)
Drug<-c(rep("Placebo",5),rep("LowDose",5),rep("HighDose",5))
newDrug<-data.frame(a,Drug)
newDrug$Drug<-factor(newDrug$Drug)

attach(newDrug)
by (a, factor(Drug), mean)
by (a, factor(Drug), sd)
by (a, factor(Drug), var)
mean(a)
sd(a)
var(a)


plot(p~Drug, data=newDrug)

results= aov(a~Drug, data=newDrug)
summary(results)
summary.lm(results)


pairwise.t.test(a,Drug, p.adjust="bonferroni")

TukeyHSD(results, conf.level=0.95)





