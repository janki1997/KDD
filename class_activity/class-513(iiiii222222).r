
###vector####

x<-1.9
mode(x)
typeof(x)
is.vector(x)
length(x)



##factor###

?factor
cat<-c("good","bad","good","bad","bad","bad","good")

typeof(cat)
cat2<-factor(cat)
cat2
typeof(cat2)


cat3<-factor(cat,levels = (c("good","bad")))
cat3
catnumb<-as.numeric(cat3)
catnumb

days<-c("Monday","Tuesday","Wednesday","Thursday","Saturday","Sunday")

days
days_factor<-factor(days)

days_factor<-factor(days,levels = (c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")))
days_factor

asint<-as.integer(days_factor)
mode(days)
typeof(days)

##LIST##
my.lst <-list(34453, c("khasha","dehnad"), c(14.3,12,15,19))
my.lst

my.lst <-list(stud.id=34453,
               stud.name=c("First Name", "last Name"),
               stud.marks=c(14,3,12,15,19))

is.list(my.lst)
mode(my.lst)
typeof(my.lst)
length(my.lst)

my.lst2<-list(seq=1:10,my.lst)
length(my.lst2)

##DATA FRAME##
my.dataset <- data.frame(site=c('A','B','C','D','E'),ph=c(7.4,6.3,8.6,7.2,8.9))
is.list(my.dataset)
is.data.frame(my.dataset)
is.matrix(my.dataset)
typeof(my.dataset)
length(my.dataset)

View(my.dataset)

data()
