rm(list = ls())
data(iris)
View(iris)

length(iris)
nrow(iris)
iris_missing<-iris
iris_missing[c(3,30,40),3]<-NA

summary(iris_missing)


?boxplot()
boxplot(iris[1:3])
?hist()
hist(iris$Sepal.Length)
?pairs()
pairs(iris[1:2])

pairs(iris[1:4])
pairs(iris[1:4], main="Iris Data", pch =  10)

pairs(iris[1:4], main = "Anderson's Iris Data --3 species", pch= 21 , bg = c("red","Green3","Blue")[factor(iris$Species)])
?plot
plot(iris[,1:2])

iris_missing<-iris
iris_missing[c(3,30,40),3]<-NA
?na.omit
iris_missing<-na.omit(iris_missing)

dev.off()
iris_missing<-iris
iris_missing[c(3,30,40),3]<-NA



x<-c(1,2,6,6,6,7,7)
unique.x<-unique(x)
?match()
?tabulate()
tab<-tabulate(match(x,unique.x))
unique.x[tab == max(tab)]


mfv<-function(x){
  unique.x <- unique(x)
  tab <- tabulate(match(x.unique.x))
  unique.x[tab == max(tab)]
  
}

mfv.x <- mfv(x)
is.vector(mfv.x)

is.na(iris_missing$Petal.Length)
iris_missing[is.na(iris_missing$Petal.Length),"Petal.Length"]<-2.2

iris_missing<-iris
iris_missing[c(3,30,40),3] <- NA

library('VIM')

#install KNN

