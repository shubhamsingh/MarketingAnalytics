#multiple Linear Regression with more than 2 variable

mtcars
names(mtcars)
head(mtcars)
?mtcars
model1 = lm(mpg~disp+cyl+hp+drat+wt+qsec+carb,data=mtcars)
summary(model1)
model2 = lm(mpg ~ disp + cyl + wt,data=mtcars)
summary(model2)
#anova(model1,model2)
anova(model2,model1)
