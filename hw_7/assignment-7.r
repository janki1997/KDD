##Name- Janki Patel
##CWID - 10457365
##subject - Knowledge discovery and data mining
##Class- CS513-A
##Assignment - 7

rm(list=ls())

#load the library
library(neuralnet)

ChooseFile <- file.choose()
breastcancer <- read.csv(ChooseFile,header = TRUE, na.strings=' ')
View(breastcancer)

breastcancer<-data.frame(lapply(na.omit(breastcancer),as.numeric))


table(breastcancer$diagnosis)


#splitting data
index<-sort(sample(nrow(breastcancer),as.integer(.70*nrow(breastcancer))))
trainingdataset<-breastcancer[index,]
testdataset<-breastcancer[-index,]
dev.off()
?neuralnet()
model<- neuralnet(diagnosis~.,trainingdataset[-1], hidden=5, threshold=0.01)

#Plotting neural network
plot(model)


ann <-compute(model,testdataset)
ann$net.result

anncat<-ifelse(ann$net.result <1.5,1,2)
length(anncat)
length(testdataset$diagnosis)
table(anncat,testdataset$diagnosis)

#finding error rate
wrong<- (testdataset$diagnosis!=anncat)
error_rate<-sum(wrong)/length(wrong)
error_rate
