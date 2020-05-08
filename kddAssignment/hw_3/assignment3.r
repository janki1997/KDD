##Name- Janki Patel
##CWID - 10457365
##Assignment-2
##subject - Knowledge discovery and data mining
##Class- CS513-A




rm(list=ls())


bcancer<- read.csv("C:/Users/Janki/Desktop/CS-513(KDD)/hw_3/breast-cancer-wisconsin.data.csv",na.string = "?")
f<-data.frame()
?install.packages
installed.packages()
install.packages("kknn")
library(kknn)


?kknn()

missingvalue<-na.omit(bcancer)
View(missingvalue)

##missingvalue$Class<-factor(missingvalue$Class, labels = c("begin","malignant"))
##View(missingvalue$Class)




idx<-sort(sample(nrow(missingvalue),as.integer(.70*nrow(missingvalue))))
train<-missingvalue[idx,]
test<-missingvalue[-idx,]

summary(test)
summary(train)
library(kknn)
library(class) 


predictk3 <- kknn(formula=Class~., train, test, k=3,kernel ="rectangular")
predictk5 <- kknn(formula=Class~., train, test, k=5,kernel ="rectangular")
predictk10 <- kknn(formula=Class~., train, test, k=10,kernel ="rectangular")




f3 <- fitted(predictk3)
table(test$Class,f3)

f5 <- fitted(predictk5)
table(test$Class,f5)

f10 <- fitted(predictk10)
table(test$Class,f10)

