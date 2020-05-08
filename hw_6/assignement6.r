##Name- Janki Patel
##CWID - 10457365
##subject - Knowledge discovery and data mining
##Class- CS513-A
##Assignment - 6


rm(list = ls())
ChooseFile <- file.choose()
breastc <- read.csv(ChooseFile,header = TRUE, na.strings=' ')
View(breastc)

#random index creation
idxx<-sort(sample(nrow(breastc),as.integer((.70*nrow(breastc)))))
train_data<-breastc[idxx,]
test_data<-breastc[-idxx,]

#install.packages("C50")
library(C50)
c50class<-C5.0(factor(Class)~.,data=train_data)
summary(c50class)
plot(c50class)


Predict<-predict(c50class,test_data,type="class")

#creates frequency table
table(actual=test_data[,11],Predict)

#percentage accuracy
match_data<-(test_data[,11]==Predict)*100
ac<-sum(match_data)/length(match_data)
ac

#error-rate
err<-(test_data[,11]!=Predict)
err_rate<-sum(err)/length(err)
err_rate




#########
rm(list=ls())

#load the library
library(randomForest)

ChooseFile <- file.choose()
breastc <- read.csv(ChooseFile,header = TRUE, na.strings=' ')
View(breastc)

#factoring
breastc$Class <- factor(breastc$Class, levels = c(2,4),labels = c("Benign", "Malignant"))
breastc<-na.omit(breastc)

#dividing test and training data
dex<-sort(sample(nrow(breastc),as.integer(.70*nrow(breastc))))
traindata<-breastc[dex,]
testdata<-breastc[-dex,]

dev.off()
fitting <- randomForest( Class~., data=traindata, importance=TRUE, ntree=1000)
importance(fitting)
varImpPlot(fitting)
predict<- predict(fitting, testdata)
table(actual=testdata$Class,predict)

#find the error rate
error_rate<- (testdata$Class!=predict)
error<-sum(error_rate)/length(error_rate)
error 
