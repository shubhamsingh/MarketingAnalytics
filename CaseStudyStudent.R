#student case study

library(gsheet)
url = 'https://docs.google.com/spreadsheets/d/1PWWoMqE5o3ChwJbpexeeYkW6p4BHL9hubVb1fkKSBgA/edit#gid=2051155174'
denco2 = as.data.frame(gsheet2tbl(url))
str(denco2)
