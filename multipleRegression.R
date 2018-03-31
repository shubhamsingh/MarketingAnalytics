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
