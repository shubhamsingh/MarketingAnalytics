marks=data.frame(A=c(1.0,1.5,3.0,5.0,3.5,4.5,3.5),B=c(1,2,4,7,5,5,4.5))
marks
c1 = kmeans(marks,3)
c1=cbind(marks,c1$cluster)
plot(marks,pch=10,col=c1$cluster)