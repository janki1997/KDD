##Name- Janki Patel
##CWID - 10457365
##subject - Knowledge discovery and data mining
##Class- CS513-A
##MidTerm_Exam

rm(list=ls())

#choose cvs file

covid19 = read.csv('C:/Users/Janki/Desktop/CS-513(KDD)/COVID19_v3.csv')
covid19<- na.omit(covid19)

#normalizing
norm <- function(x){
  y<- (x-min(x))/(max(x)-min(x))
  return(y)
}
#Removing the first column
covid19<- covid19[-1]

#Normalizing  cbind 
Covid19Normalized<- cbind.data.frame(Age = norm(covid19[, 1]), 
                                    Exposure = norm(covid19[, 2]),
                                    MaritalStatus = norm(as.numeric(covid19[, 3])), 
                                    Cases = norm(covid19[, 4]),
                                    MonthAtHospital = norm(covid19[, 5]), 
                                    Infected = covid19[, 6])

summary(covid19)

#splitting the data
idx<-sample(nrow(covid19),.3*nrow(covid19))
test<-covid19[idx,]
train<-covid19[-idx,] 

#KNN MODEL
library(kknn)

#K=5 
predict19_knn <- kknn(formula = Infected~.,train,test,k=5,kernel = "rectangular")
model19_predict <- fitted(predict19_knn)
confusionMatrix_knn<-table(model19_predict,test$Infected)
confusionMatrix_knn

#accuracy 
accuracy19 <- function(x){
  sum(diag(x))/(sum(rowSums(x)))*100
}
accuracy19(confusionMatrix_knn)
