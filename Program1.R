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
