?install.packages
#check you see if you have knn
installed.packages()
install.packages("kknn")

library(kknn)
?kknn()
data(iris)
View(iris)

?sample()
range_1_100<-1:100
sample(range_1_100,80)
sampl80<- sort(sample(range_1_100,80))



index <- seq(1,nrow(iris), by=5)
test<- iris[index,]
training<-iris[-index,]

?kknn()

predict_k5 <- kknn(formula = Species~.,training, test[,5], k=5, kernel = "rectangular")
fit<- fitted(predict_k5)
table(test$Species,fit)

firstlastcol<-cbind(iris[,1],iris[,5])