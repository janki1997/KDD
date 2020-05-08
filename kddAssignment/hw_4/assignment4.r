## CS513
## First Name:  Janki
## Last Name:   Patel
## CWID:        10457365
## Assignment - 4


rm(list=ls())

bcancer <- read.csv("C:/Users/Janki/Desktop/CS-513(KDD)/hw_4/breast-cancer-wisconsin.data.csv",na.string = "?",colClasses=c("Class"="factor"))
View(bcancer)

##remove missing values 
DataF <- data.frame(bcancer)
removed_data <- na.omit(DataF)

##Converting type of F6 from character to numeric
removed_data$F6<-as.integer(removed_data$F6)

##factorclass row
?factor
removed_data$Class <- factor(removed_data$Class,labels = c("begin" ,"malignant"))

idx <- floor(0.70 * nrow(removed_data))

#Set the seed to make your partition reproducible
set.seed(123)
index <- sample(seq_len(nrow(removed_data)), size = idx)

training <- removed_data[index, ]
test <- removed_data[-index, ]

install.packages("e1071")
install.packages(class)
library(e1071)
library(class)

##NaiveBayes
modelnaive<- naiveBayes(Class ~ ., data = training)

predictnaive <- predict(modelnaive, test)

table(modelnaive=predictnaive,class=test$Class)

##prop table
prop.table(table(modelnaive=predictnaive,class=test$Class))


wrongprediction<-sum(predictnaive!=test$Class)

wrongpredictionrate<-wrongprediction/length(predictnaive)

##RESULT
print(paste("Total bad Predictions:" , wrongprediction))
print(paste("Error rate :" , wrongpredictionrate))
print(paste("Accuracy :" , 100-(wrongpredictionrate*100)))

