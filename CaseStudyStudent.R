#student case study

library(gsheet)
url = 'https://docs.google.com/spreadsheets/d/1PWWoMqE5o3ChwJbpexeeYkW6p4BHL9hubVb1fkKSBgA/edit#gid=2051155174'
denco2 = as.data.frame(gsheet2tbl(url))
str(denco2)


stu = denco2  # keeping a backup
?summary
summary(stu)


dim(stu)
aggregate(stu$age, by=list(stu$sname),FUN=max)

library(dplyr)
df= stu %>% dplyr::filter(city == 'Noida') 
#%>% dplyr::summarise(n = n())
df


c=group_by(df,br)
c


d= group_by(c,br=='CS')  #filter(city == 'Delhi') #%>%
d[order(br,decreasing = T)]

a$br
