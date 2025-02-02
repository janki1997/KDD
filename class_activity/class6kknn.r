#  Course          : Data Mining
#  First Name      : Khasha
#  Last Name       : Dehnad
#  Id              : 12345
#  purpose         : apply knn to iris dataset

## Step 0 clean up!!!


## remove all objects
rm(list=ls())

?install.packages
# check to see if you have the kknn package
installed.packages()
#install.packages("kknn")
#Use the R library("kknn") 

library(kknn)
?kknn()
#Load the iris dataset and attach it
data(iris)
View(iris)

?sample()
range_1_100<- 1:100
sample(range_1_100,80)
smpl80 <- sort(sample(range_1_100,80))
?sort()

idx<-sort(sample(nrow(iris),as.integer(.65*nrow(iris))))

training<-iris[idx,]

test<-iris[-idx,]



index <- seq(1,nrow(iris),by=5)

test<-iris[index,]
training <-iris[-index,]

?kknn()

predict_k5 <- kknn(formula=Species~., training, test[,-5], k=5,kernel ="rectangular"  )

fit <- fitted(predict_k5)
table(Actual=test$Species,Fitted=fit)

firstlastcol<-cbind(iris[,1],iris[,5])



##Define max-min normalization function
mmnorm <-function(x,minx,maxx) {z<-((x-minx)/(maxx-minx))
return(z) 
}

iris_normalized<-as.data.frame (         
  cbind( Sepal.Length=mmnorm(iris[,1],min(iris[,1]),max(iris[,1]))##nomrmalize 1st coloumn
         , sepal.Width=mmnorm(iris[,2],min(iris[,2]),max(iris[,2] ))
         ,Petal.Length=mmnorm(iris[,3],min(iris[,3]),max(iris[,3] ))
         , Petal.Width=mmnorm(iris[,4],min(iris[,4]),max(iris[,4] ))
         ,Species=as.character(iris[,5])
         
  )
)
index <- seq(1,nrow(iris_normalized ),by=5)


test<-iris_normalized[index,]
training <-iris_normalized[-index,]

predict_k5 <- kknn(formula=Species~., training, test[,-5], k=5,kernel ="triangular" )
fit <- fitted(predict_k5)
table(test$Species,fit)



