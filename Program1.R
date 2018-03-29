#data structures in R

#vector----

v1 = c('A','B','C')
v2 = c(1,2,3)
class(v1)
class(v2)
v3=c(TRUE,FALSE)
class(v3)
(v4 = 100:200)
v5 = seq(1,100,2)
v5
(v4[c(1,3,5)])
v4[v4>50]
v7 = c('A','Z')
# v1 [ v1  v7 ]
v1[1]
v1['A']
(v8 = 10:15)
names(v8) = c('A','B','C','D','E')
v8['C']
v8 [2:4]
v8[3]
v8[c('A','D')]

df = data.frame(rollno=c(1,2,3), name=c('a','b','c'),course=c('MBA','B.Tech','M.Tech'),marks=floor(runif(3,50,76)))
df 
df = fix(df)
#rm (list=ls())
ls()
summary(df)

(mylist =list(1,df,v4))

(mymatrix = matrix(1:24,nrow =4,byrow = T))
?matrix

mymatrix[,1:3]
mymatrix[1:2,]
mymatrix[2:3,1:3]
mymatrix[1,1]
?matrix

dimnames(mymatrix) = list(c('c1','c2','c3','c4'), c(paste('c',1:6,sep='-')))
mymatrix
paste('C',1:4,sep='') #concatenate

?array
(ma = array(101:124, dim=c(2,4,3),dimnames(list(c('s1','s2','s3','s4'),c('sub1','s2','s3'),c('d1','d2','d3')))))
ma

df
df$rollno
df[1:3,]
df[,1:4]
df$gender=c('M','F','M')
df
str(df)

df$gender=factor(df$gender)
str(df)

df$grade=c('A','B','C')
df
df$grade=factor(df$grade,order=T,levels=c('C','B','A'))
str(df)
table(df$course,df$gender)
mymatrix
apply(mymatrix,1,sum)  #row wise sum
apply(mymatrix,2,sort)  #col wise sum
apply(ma,3,mean)  #matrix 3D wise sum
?apply
tapply(df$name,df$marks)
df$gender=NULL
df
df[df$marks > 60,]

stack(df)

