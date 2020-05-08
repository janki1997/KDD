hello<-c("Hello world")

?length()
hello
length(hello)

?is.vector()
is.vector(hello)
mode(hello)

x1<-c(10,5,6,6,6,7)
x1
mode(x1)
x2<-c(1,2,3,4)
x2

x3<-x1+x2

x1
x2
x3

?seq()
x3<-seq(from=10.2,to=26.5,by=2.1)
mode(x3)
typeof(x3)

mixed_vector<-c(1,2,8.5,'5')
mode(mixed_vector)
typeof(mixed_vector)

x4<-c(1,2,3,4,5,6)
mode(x4)
typeof(x4)

x5<-seq(from=1,to=6,by=1)
typeof(x5)

x6<-1:6
typeof(x6)

x7<-as.integer(x5)
typeof(x7)

mixed_vector<-c(1,2,8.5,'5')
mode(mixed_vector)

ls()
?rm()

objects<-ls()
?rm()
rm(list=ls())
