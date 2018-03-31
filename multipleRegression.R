#multiple Linear Regression with more than 2 variable

mtcars
names(mtcars)
head(mtcars)
?mtcars
M1 = lm(mpg~disp+cyl+hp+drat+wt+qsec+carb,data=mtcars)
summary(model1)
M2 = lm(mpg ~ disp + cyl + wt,data=mtcars)
summary(model2)
#anova(model1,model2) model 1 par < model2 par and 1 subset of 2
anova(M2,M1)
# M2 is better than M1 Accepted if p value >0.05
M3 = lm(mpg~cyl+wt,data=mtcars)
summary(M3)
anova(M3,M1) #M3 is better

#way to select parameters for modeling
library(MASS)
#AIC Alkai as less as possible
step=stepAIC(M1,direction = 'both')

library(olsrr)

model=lm(mpg ~ disp  + hp + wt + qsec,data=mtcars)
model
k=ols_step_all_possible(model)
plot(k)



#Logistic Rigression for two variable eg Pass/Fail

library(ISLR)
attach(Default)
str(Default)
head(Default)
summary(Default)
?glm
logit=glm(default~income+balance+student,family = 'binomial',data=Default)
summary(logit)

(df=mtcars)
(df$cyl = factor(df$cyl))
(df$am = factor(df$am))
summary(mtcars)
M1 =lm(mpg ~wt+cyl,data=df)
summary(M1)
summary(df$cyl)
data.frame(wt=c(2,3),cyl=factor(c(4,6)))
#wt must be in range
#predict(M1, newdata = data.frame(wt=c(2,3),cyl=factor(c(4,6))))
#Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0   Min.   :2.760   Min.   :1.513  
#1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5   1st Qu.:3.080   1st Qu.:2.581  
#Median :19.20   Median :6.000   Median :196.3   Median :123.0   Median :3.695   Median :3.325  
#Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7   Mean   :3.597   Mean   :3.217  
#3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0   3rd Qu.:3.920   3rd Qu.:3.610  
#Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0   Max.   :4.930   Max.   :5.424  
#qsec             vs               am              gear            carb      
#Min.   :14.50   Min.   :0.0000   Min.   :0.0000   Min.   :3.000   Min.   :1.000  
#1st Qu.:16.89   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:3.000   1st Qu.:2.000  
#Median :17.71   Median :0.0000   Median :0.0000   Median :4.000   Median :2.000  
#Mean   :17.85   Mean   :0.4375   Mean   :0.4062   Mean   :3.688   Mean   :2.812  
#3rd Qu.:18.90   3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:4.000   3rd Qu.:4.000  
#Max.   :22.90   Max.   :1.0000   Max.   :1.0000   Max.   :5.000   Max.   :8.000  


