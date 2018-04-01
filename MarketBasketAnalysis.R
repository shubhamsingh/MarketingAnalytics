library(arules)
library(arulesViz)
library(datasets)

myDataFrame=Groceries
myDataFrame
#convert from data frame to transaction form
#transData = ()
data(Groceries)
head(Groceries)
str(Groceries)

inspect(Groceries[1:5])
LIST(Groceries[1:5])
#Apriori Algorithms
frequentitem = eclat(Groceries,parameter = list(supp=0.005,minlen =1,maxlen=5))

frequentitem
inspect(frequentitem[1:32])
summary(frequentitem)

inspect(sort(frequentitem,by='count',decreasing = TRUE)[1:5])
?eclat

itemFrequencyPlot(Groceries,topN =15,type="absolute")
rule = arules::apriori(Groceries,parameter =list(supp=0.005,conf=0.5))
rule                  
inspect(rule[1:5])


head(rule)
write.csv(inspect(rule),'output.csv')

rulsec = sort(rule, by ='confidence', decreasing = T)
inspect(rulsec)
sum(is.redundant(rule))
(redundant = which(is.redundant(rule)))
rulenr = rule[-redundant]
is.redundant(rulenr)

rule=apriori(data=Groceries,parameter = list(supp=0.01,conf=0.08),appearance = list(default='lhs',rhs='whole milk'),control = list(verbose=F))
inspect(rule)

rule=apriori(data=Groceries,parameter = list(supp=0.01,conf=0.08),appearance = list(default='rhs',lhs='whole milk'),control = list(verbose=F))
inspect(rule)
#visualization rule

plot(rule,measure=c("support","lift"),shadind="confidence")






