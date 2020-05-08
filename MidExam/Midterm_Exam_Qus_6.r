##Name- Janki Patel
##CWID - 10457365
##subject - Knowledge discovery and data mining
##Class- CS513-A
##MidTerm_Exam


rm(list=ls())

## Choose the csv file
ChooseFile <- file.choose()
Covid19 <- read.csv(ChooseFile,header = TRUE, na.strings=' ')

## Omit the missing values 
Covid19_NoMissing <- na.omit(Covid19)

## Discretize the Age and MonthAtHospital Columns by using the cut Function to convert continous variable to categorical variable
M_Month <- max(Covid19_NoMissing$MonthAtHospital)
M_Age <- max(Covid19_NoMissing$Age)
M_Age
Covid19_NoMissing$MonthAtHospital <- cut(Covid19_NoMissing$MonthAtHospital, breaks = c(-1,6,M_Month), labels = c("Less than 6 Months","6 or More Months"))
Covid19_NoMissing$Age <- cut(Covid19_NoMissing$Age, breaks = c(-1,35,50,M_Age), labels = c("Less than 35","35 to 50","51 or over"))
View(Covid19_NoMissing)

# Split the data 
split_data <- sort(sample(nrow(Covid19_NoMissing), as.integer(.70*nrow(Covid19_NoMissing))))

Covid19_Train <- Covid19_NoMissing[split_data,]
Covid19_Test <- Covid19_NoMissing[-split_data,]


library(e1071)
library(class)
install.packages("rpart")
install.packages("RColorBrewer")
library(rpart)
install.packages("rattle")
library(rpart.plot)  			# Enhanced tree plots
library(rattle)           # Fancy tree plot
library(RColorBrewer)     # colors needed for rattle



Covid19_Train$Infected <- as.factor(Covid19_Train$Infected)

predict19_model<-rpart(Infected~.,Covid19_Train[,-1])
rpart.plot(predict19_model,roundint = FALSE)
predict19_data<-predict(predict19_model,Covid19_Test[,-1],type="class") 
table(Covid19_Test[,7],predict19_data)

fancyRpartPlot(predict19_model)

#accuracy
wrong <- sum(Covid19_Test[,7] != predict19_data)
Err_rate <- wrong/length(Covid19_Test[,7])
Err_rate

