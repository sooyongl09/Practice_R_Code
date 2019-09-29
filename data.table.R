library(data.table); library(tidyverse)
getwd()

titanic <- fread("titanic.csv")
class(titanic)
data.frame(titanic); 
titanic <- data.table(titanic)

titanic[1]
head(titanic[ , .(V1)])

head(titanic[ , V1])
head(titanic[ , 1])

titanic[pclass == "1st"]
titanic[pclass == "1st", ]

setkey(titanic, pclass); tables()
titanic[J("1st"), mean(survived)]
titanic[pclass == "1st", mean(survived)]
titanic[pclass == "1st", mean(survived), by = "sex,boat"]
titanic[pclass == "1st", .N, by = "sex,boat"]
titanic[pclass == "1st", length(which(age > 20))/.N, by = "sex"]

titanic[pclass == "1st", .N]

titanic[, `:=`(isminor, "adult")]
titanic[, pclass]
titanic[, .(pclass)]

titanic[, .(pclass, survived)][, unique(pclass), by=survived]
titanic[, unique(pclass), by=survived]



