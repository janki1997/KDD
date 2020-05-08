##Name- Janki Patel
##CWID - 10457365
##subject - Knowledge discovery and data mining
##Class- CS513-A
##Assignment - 8


rm(list=ls())

#load the file
ChooseFile <- file.choose()
breastc <- read.csv(ChooseFile,header = TRUE, na.strings=' ')
View(breastc)
summary(breastc)
table(breastc$diagnosis)
#factoring
breastc<-na.omit(breastc)
breastc<-breastc[-1]
cancerlist<-dist(breastc[,-1])
clustresult<-hclust(cancerlist)
plot(clustresult)
clust2<-cutree(clustresult,2)
table(clust2,breastc[,1])


rm(list=ls())
#load the file
ChooseFile <- file.choose()
breastc <- read.csv(ChooseFile,header = TRUE, na.strings=' ')
View(breastc)
summary(breastc)
table(breastc$diagnosis)
#To factor the data set
breastc<-na.omit(breastc)
breastc<-breastc[-1]
kmeans<- kmeans(breastc[,-1],2,nstart = 10)
kmeans$cluster
table(kmeans$cluster,breastc[,1])

