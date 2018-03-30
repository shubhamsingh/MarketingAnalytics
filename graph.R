attach(women)
women
barplot(height)
barplot(weight)
library(vcd)
count = table(Arthritis$Improved, Arthritis$Treatment)
count
barplot(count,horiz = F,col=c("red","yellow","blue"))

par(mfrow=c(2, 2))
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls,
    main="Simple Pie Chart")
pct <- round(slices/sum(slices)*100)
lbls2 <- paste(lbls, " ", pct, "%", sep="")
pie(slices, labels=lbls2, col=rainbow(length(lbls2)),
    main="Pie Chart with Percentages")
library(plotrix)
pie3D(slices, labels=lbls,explode=0.1,
      main="3D Pie Chart ")
mytable <- table(state.region)
lbls3 <- paste(names(mytable), "\n", mytable, sep="")
pie(mytable, labels = lbls3,
    main="Pie Chart from a Table\n (with sample sizes)")
hist(mtcars$mpg)
boxplot(mtcars$mpg)


v1 = c(1,2,NA,NA,5)
is.na(v1)
mean(v1,na.rm=T)
v1a = na.omit(v1)
sum(v1a)
?na.omit
anyNA(v1)
v1[is.na(v1)] = mean(v1,na.rm = T) #substitue NA with Mean
v1

library(VIM)
data(sleep,package = 'VIM')
head(sleep)
dim(sleep)
complete.cases(sleep)
sleep[complete.cases(sleep),]
sum(is.na(sleep$Dream))
mean(is.na(sleep$Dream))
mean(complete.cases(sleep))
colSums(is.na(sleep))
rowSums(is.na(sleep))

library(mice)
mice::md.pattern(sleep)
#42 rows without any missing values #2 rows with 1 NA Nond

VIM ::aggr(sleep, prop=F,numbers=T)

L1=letters[1:26]
(M2=month.name[1:12])
sample(L1,5,replace=T)
sample(M2,5,replace = T)


set.seed(100)
sample(M2,5,replace = T)
set.seed(100)
sample(M2,5,replace = T)

sample(M2,5,replace = T)
(grades=LETTERS[1:5])
(sgrades = sample(grades,20,replace = T,prob=c(0.4,0.3,0.1,0.1,0.1)))

  