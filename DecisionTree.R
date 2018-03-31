student = data.frame(rollno=c('s1','s2','s3','s4','s5'),gender = c('F','F','M','M','F'),play = c('Play','NotPlay','Play','Notplay','play'))

(rollno = paste('s',1:30,sep=''))
set.seed(10)
gender=sample(x=c('M','F'),size=30,replace=T,prob=c(0.5,0.5))
gender
play=(sample(x=c('play','notplay'),size=30,replace=T,prob=c(0.5,0.5)))
play
table(play)
prop.table(table(play))

student1 =data.frame(rollno,gender,play)

library(rpart)
?rpart
fit1=rpart(gender~play,data=student1,minsplit=4,minbucket=2)
fit1

library(rpart.plot)
rpart.plot(fit1,main='classification Tree')
table(student1$gender)



predict(fit1,newdata = data.frame(gender='F'))
predict(fit1,newdata = data.frame(gender=c('M','F','M')))

married = sample(x=c('Married','Single'),size=30,replace=T,prob=c(0.3,0.7))
table(married)

student2 =data.frame(gender,play,married)
student2
library(rpart)
?rpart
fit2=rpart(play~gender+married,data=student2,minsplit=4,minbucket=2)
summary(fit2)

library(rpart.plot)
rpart.plot(fit2,main='classification Tree',type=2,extra=104,tweak=1.2,under=T,shadow=c('brown','green','red'),nn=T)
table(student1$gender)

(testdata=data.frame(gender=c('M','M','F','F'), married=c('Married','Single','Married','Single')))
#?predict
(P1=predict(fit2,newdata = testdata,type='class'))



#fit2 = rpart(play ~ gender + married, data=students2, minsplit=5)
summary(fit2)
fit2
rpart.plot(fit2,type=2,extra=104, tweak=1.2, under=T, shadow=c('brown', 'green','red'), nn=T)
fit2
prp(fit2)
prp(fit2, main="An Example",
    type=4, fallen=T, branch=.3, round=0, leaf.round=9,
    clip.right.labs=F, under.cex=1,
    box.palette="GnYlRd",
    prefix="Student\n", branch.col="gray", branch.lwd=2,
    extra=101, under=T, lt=" < ", ge=" >= ", cex.main=1.5)

prp(fit2, branch.type=5)
labels(fit2)
new.tree <- prp(fit2, snip=TRUE)$obj # interactively trim the tree
prp(new.tree) # display the new tree
#Plot----
library(RColorBrewer)
library(rattle)

rpart.plot::rpart.plot(fit2, main='Classification Tree')
rpart.plot::rpart.plot(fit2, extra=104, box.palette="GnBu", branch.lty=3, shadow.col="gray", nn=TRUE)

rpart.plot::prp(fit2,fallen.leaves = F)
prp(fit2, type=2)
?prp
windows()
rattle::fancyRpartPlot(model = fit2, main = "Final CART Regression Tree", cex = 0.6, sub = "Model2")

#Predict
#
predict(fit2, newdata = data.frame(gender='M', married='Married'), type='prob')
predict(fit2, newdata = data.frame(gender='M', married='Married'), type='class')
predict(fit2, newdata = data.frame(gender='M', married='Married'), type='vector')



predict(fit2, newdata = data.frame(gender='M', married='Married'))
?predict


testdata = data.frame(gender=c('M','M','F','F'), married=c('Married','Single','Married','Single'))
testdata

(p1 = predict(fit2, newdata = testdata, type='vector'))  #node/level 
#play=2, notplay=1
(p2 = predict(fit2, newdata = testdata, type='class')) #factor
(p3 = predict(fit2, newdata = testdata, type='prob')) # prob

cbind(testdata, p1, p2, p3)
#level number, class frequencies, probabilities
predict(fit2, newdata= testdata, type = "matrix")

head(students2)

#Parameters Setting : CP
printcp(fit2)
printcp(fit2, digits = getOption("digits") - 5)
plotcp(fit2)
names(fit2)
?
  fit2$where  #which row at which nodeno
?fit2$where
student1[1:5,]
cbind(student1, nodeno=rownames(fit2$frame) [ fit2$where])
packages("rpart")
pfit=  prune(fit2, cp=0.1) # from cptable  
pfit
#--------------------------------------------------------

#add column with 3 classes and numeric and logical
set.seed(105)
education = sample(x=c('school','graduate', 'pg'), size=30, replace=T, prob=c(0.3,0.4,.3) )
education; table(education)
set.seed(106)
hostel = sample(x=c(TRUE, FALSE), size=30, replace=T, prob=c(.3,.7))
table(hostel)
set.seed(107)
marks = floor(runif(30,50,100))
mean(marks)
students3 = data.frame(gender, married, education, hostel,marks,play)
with(students3, ftable(education, hostel, gender, married,play))

# Model3
fit3a = rpart(play ~ ., data=students3)
fit3a
rpart.plot::rpart.plot(fit3a, main='Classification Tree')

#Model3b : change some parameters minbucket, minsplit
fit3b = rpart(play ~ ., data=students3, minsplit=4, minbucket=2) #control= rpart.control(cp=0.00001))#use low cp
fit3b
rpart.plot::rpart.plot(fit3b, main='Classification Tree', cex=.6, type=3, extra=104, nn=T)
rpart.plot::prp(fit3b)
rattle::fancyRpartPlot(model = fit3b, main = "Final CART Regression Tree", cex = 0.6, sub = "Model3")
prp(fit3b,box.col=c("Grey", "Orange")[fit3$frame$yval],varlen=0,
    faclen=0, type=1,extra=4,under=TRUE, tweak=1.2)


#Lets see CP
plotcp(fit3b)
printcp(fit3b, digits = getOption("digits") - 5)
(bestcp= fit3b$cptable[which.min(fit3b$cptable[,'xerror']),'CP'])
#but this is at root node only, select next better 
bestcp = 0.01

prp(fit3b)
fit3b2 = rpart(play ~ ., data=students3, minsplit=4, minbucket=2, control= rpart.control(cp=0.001))
fit3b2
prp(fit3b2)
fit3b.pruned = prune(fit3b, cp=bestcp)
fit3b.pruned
prp(fit3b.pruned)

rpart.plot(fit3b.pruned,cex=.6, extra=101, type=1)


#Predict Model3
fit3b.pruned$where
fit3b.pruned
path.rpart(fit3b.pruned, nodes=c(1,4,10,43), pretty = 0, print.it = TRUE)
testdata1= data.frame(gender='Male', married='Married', education='school', hostel=TRUE, marks=60)
testdata1
predict(fit3b.pruned, newdata = testdata1 )



# now practise with Marketing Data