## CS513
## First Name:  Janki
## Last Name:   Patel
## CWID:        10457365 
## Assignment - 5

rm(list=ls()) 
library(rpart)
library(rpart.plot)
library(RColorBrewer)
library(rattle)

bcancer <- read.csv("C:/Users/Janki/Desktop/CS-513(KDD)/hw_5/breast-cancer-wisconsin.data.csv")
View(bcancer)
bcancer$Class <- factor(bcancer$Class, levels = c(2,4), labels = c("Benign", "Malignant")) 
set.seed(111)


idx<-sort(sample(nrow(bcancer),as.integer((.30*nrow(bcancer)))))
training_data <- bcancer[-idx,]
test_data =bcancer[idx,]

dev.off()
Cartclass<- rpart( Class~., data =training_data )
summary(Cartclass)

rpart.plot(Cartclass)


predictcart<-predict( Cartclass ,test_data , type="class" )

##frequency 
table(Actual=test_data[,11],CART=predictcart)
predictcart2<-predict(Cartclass,test_data)
str(predictcart2)
predictcart_cat<-ifelse(predictcart2[,1]<=.5,'Malignant','Benign')
table(Actual=test_data[,11],CART=predictcart_cat)

##percentage accuracy
match<- (test_data[,11]==predictcart)*100
acc<-sum(match)/length(match)
acc

##error rate
error<- sum(test_data[,11]!=predictcart)
errorrate<-error/length(test_data[,11])
errorrate

library(rpart.plot)
prp(Cartclass)

##graph
fancyRpartPlot(Cartclass)

