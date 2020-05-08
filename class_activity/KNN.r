
install.packages("VIM")

library('VIM')
?KNN
iris_missing<-iris
iris_missing[c(3,40,80),3]<-NA

iris_no_missing2<-KNN(iris_missing,variable ='Petal.length',k=3,dist_var=c('Sepal.length','Sepal.width'))
table(iris_no_missing2[,5],iris_no_missing2[,6])
