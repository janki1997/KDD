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
max_Month <- max(Covid19_NoMissing$MonthAtHospital)
max_Age <- max(Covid19_NoMissing$Age)
max_Age
Covid19_NoMissing$MonthAtHospital <- cut(Covid19_NoMissing$MonthAtHospital, breaks = c(-1,6,max_Month), labels = c("Less than 6 Months","6 or More Months"))
Covid19_NoMissing$Age <- cut(Covid19_NoMissing$Age, breaks = c(-1,35,50,max_Age), labels = c("Less than 35","35 to 50","51 or over"))
View(COVID19_No_Missing)

##Normalize the Data using min max 
mmnorm <-function(x,minx,maxx) {z<-((x-minx)/(maxx-minx))
return(z) 
}

Covid19Normalized<-as.data.frame (         
  cbind(   Exposure=mmnorm(Covid19_NoMissing[,3],min(Covid19_NoMissing[,3]),max(Covid19_NoMissing[,3]))
          ,Cases=mmnorm(Covid19_NoMissing[,5],min(Covid19_NoMissing[,5]),max(Covid19_NoMissing[,5]))
          ,ID=as.character(Covid19_NoMissing[,1])
          ,MartialStatus=as.character(Covid19_NoMissing[,4])
          ,Infected=as.character(Covid19_NoMissing[,7])
          ,MonthAtHospital=as.character(Covid19_NoMissing[,6])
          ,Age=as.character(Covid19_NoMissing[,2])
          
          
  )
)


View(Covid19Normalized)


# Split the data 
split_data <- sort(sample(nrow(Covid19Normalized), as.integer(.70*nrow(Covid19Normalized))))

Covid19_Train <- Covid19Normalized[split_data,]
Covid19_Test <- Covid19Normalized[-split_data,]

install.packages("e1071")
install.packages(class)
library(e1071)
library(class)

#Naive Bayes 
?naiveBayes

Covid19_Train$Infected <- as.factor(Covid19_Train$Infected)
NB_model<- naiveBayes(Infected ~ ., data = Covid19_Train)
NB_predict <- predict(NB_model, Covid19_Test, type = "class")
table(NB_model = NB_predict, Covid19_Test$Infected)

#accuracy
wrong19 <- sum(Covid19_Test[,5] != NB_predict)
Err_rate <- wrong19/length(Covid19_Test[,5])
Err_rate

