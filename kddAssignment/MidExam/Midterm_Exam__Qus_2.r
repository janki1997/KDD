##Name- Janki Patel
##CWID - 10457365
##subject - Knowledge discovery and data mining
##Class- CS513-A
##MidTerm_Exam


rm(list=ls())


ChooseFile<-file.choose()
Covid19<-read.csv(ChooseFile)
View(Covid19)


## Question 2(I): Summary 
summary(Covid19)


## Question 2(II): Missing Values

MissingValuesCheck <- is.na(Covid19)
MissingValues <- Covid19[!complete.cases(Covid19),]

##Question 2(III): Generate Frequncey Table of Infected vs Marital Status

frequency <- table(Covid19$Infected,Covid19$MaritalStatus)
print(frequency)


##Question 2(IV): Scatter plot of Age, Marital Status and MonthAtHospital
dev.off()
pairs(Covid19[, c("Age", "MaritalStatus", "MonthAtHospital")], upper.panel = NULL)
title("Scatter Plot")

##Question 2(v): Box plot of Age, Marital Status and MonthAtHospital
boxplot(Covid19[, c("Age", "MaritalStatus", "MonthAtHospital")])
title("Box Plot")

##Question 2(VI): Replace missing values of cases with mean cases

Covid19[is.na(Covid19[,c("Cases")])] <- mean(Covid19[,c("Cases")], na.rm = TRUE)
View(Covid19)

