##Name- Janki Patel
##CWID - 10457365
##Assignment-2
##subject - Knowledge discovery and data mining
##Class- CS513-A

rm(list=ls())
bcancer <- read.csv("C:/Users/Janki/desktop/CS-513(KDD)/hw_2/breast-cancer-wisconsin.data.csv",na.string = "?")
View(bcancer)

## question1.1 
summary(bcancer)


## question1.2
frame<-data.frame(bcancer)
a<-is.na(frame)
View(a)


#question1.3
for(i in 1:ncol(frame)){
  frame[is.na(frame[,i]), i] <- mean(frame[,i], na.rm = TRUE)
}
View(frame)


#question1.4
frame[,c(11,7)]


#question1.5
pairs(frame[,2:7])


#question1.6
boxplot(frame[8:10])
hist(frame$F7)
hist(frame$F8)
hist(frame$F9)


#question 2

rm(list = ls())
bcancer <- read.csv("C:/Users/Janki/desktop/CS-513(KDD)/hw_2/breast-cancer-wisconsin.data.csv",na.string = "?")
View(bcancer)
frame<-data.frame(bcancer)
na.omit(frame)

