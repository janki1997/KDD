##Name- Janki Patel
##CWID - 10457365
##subject - Knowledge discovery and data mining
##Class- CS513-A
##Assignment - 7


rm(list=ls())

#load the library
library(neuralnet)

ChooseFile <- file.choose()
breastc <- read.csv(ChooseFile,header = TRUE, na.strings=' ')
View(breastc)

table(breastc$diagnosis)

breastc$Class <- factor( breastc$Class, levels = c(2,4),labels = c("Benign", "Malignant"))
breastc<-data.frame(lapply(na.omit(breastc),as.numeric))

#splitting data
index<-sort(sample(nrow(breastc),as.integer(.70*nrow(breastc))))
traindata<-breastc[index,]
testdata<-breastc[-index,]
dev.off()
?neuralnet()
modell<- neuralnet(diagnosis~.,traindata[-1], hidden=5, threshold=0.01)

#Plotting neural network
plot(modell)


annal <-compute(modell,testdata)
annal$net.result

anncat<-ifelse(annal$net.result <1.5,1,2)
length(anncat)
length(testdata$diagnosis)
table(anncat,testdata$diagnosis)

#finding error rate
error<- (testdata$diagnosis!=anncat)
error_rate<-sum(error)/length(error)
error_rate
